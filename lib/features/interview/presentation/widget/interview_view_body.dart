// Full optimized version of InterviewViewBody
import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mentroverso/core/utils/app_routes.dart';
import 'package:mentroverso/core/utils/constants.dart';
import 'package:mentroverso/features/interview/presentation/views/unity_launcher.dart';
import '../../../../core/widgets/page_indicator.dart';
import 'next_button.dart';
import 'page_view.dart';
import '../../../../core/widgets/custom_gradient_circle.dart';

class InterviewViewBody extends StatefulWidget {
  const InterviewViewBody({super.key});

  @override
  State<InterviewViewBody> createState() => _InterviewViewBodyState();
}

class _InterviewViewBodyState extends State<InterviewViewBody>
    with WidgetsBindingObserver {
  final PageController pageController = PageController();
  int currentPage = 0;
  Timer? interviewTimer;
  Duration remaining = const Duration(minutes: 10);
  bool _isUnityActive = false;
  List<Map<String, dynamic>> feedbackResults = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setupUnityHandlers();
  }
  Future<String> fetchQuestionText(int questionId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("interview questions")
        .doc("${questionId - 1}")
        .get();

    if (!snapshot.exists) {
      debugPrint("❌ Question text not found for ID: $questionId");
      return "Question not found";
    }

    return snapshot.data()?["Question"] ?? "Question text missing";
  }


  Future<String> fetchCorrectAnswer(int questionId) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("interview questions")
        .doc("${questionId - 1}")
        .get();

    if (!snapshot.exists) {
      debugPrint("❌ Correct answer not found for question ID: $questionId");
      return "Correct answer not available";
    }

    return snapshot.data()?["Answer"] ?? "Correct answer missing";
  }

  Future<void> saveInterviewFeedback(
      String? userId, List<Map<String, dynamic>> feedbackList) async {
    final now = DateTime.now();
    final formattedTime = DateFormat('yyyyMMdd_HHmmss').format(now);
    final interviewId = 'interview_$formattedTime';

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .collection('interview_feedbacks')
        .doc(interviewId)
        .set({
      'interviewId': interviewId,
      'timestamp': now,
      'feedback': feedbackList,
    });
  }

  Future<Map<String, dynamic>> evaluateAnswer(
      String userAnswer, String correctAnswer) async {
    final url = Uri.parse("https://mentromateapp.azurewebsites.net/evaluate");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'user_answer': userAnswer,
        'correct_answer': correctAnswer,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to evaluate: ${response.reasonPhrase}");
    }
  }

  void _setupUnityHandlers() async {
    await UnityLauncher.initialize();

    UnityLauncher.setCompletionHandler((List<Map<String, dynamic>> result) async {
      if (!mounted) return;
      setState(() => _isUnityActive = false);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      debugPrint("📨 Interview completed with result: $result");
      List<Map<String, dynamic>> localResults = [];

      for (final item in result) {
        final questionId = item['questionId'];
        final userAnswer = item['answer']?.toString().trim() ?? "";

        try {
          final correctAnswer = await fetchCorrectAnswer(questionId);
          final questionText = await fetchQuestionText(questionId);

          if (userAnswer.isEmpty ||
              userAnswer.toLowerCase() == "no answer detected" ||
              userAnswer.toLowerCase() == "[blank_audio]" ||
              userAnswer.toLowerCase() == "[music playing]" ||
              userAnswer.toLowerCase() == "simulated answer") {
            localResults.add({
              'question_text': questionText,
              'user_answer': 'no answer detected',
              'correct_answer': correctAnswer,
              'score': 0,
              'feedback': 'No response was detected.',
            });
          } else {
            final evaluation = await evaluateAnswer(userAnswer, correctAnswer);
            localResults.add({
              'question_text': questionText,
              'user_answer': userAnswer,
              'correct_answer': correctAnswer,
              'score': evaluation['final_score'],
              'feedback': evaluation['feedback'],
            });
          }
        } catch (e) {
          debugPrint("❌ Failed to process question $questionId: $e");
          localResults.add({
            'questionId': questionId,
            'user_answer': userAnswer.isEmpty ? "no answer detected" : userAnswer,
            'correct_answer': 'Unavailable',
            'score': 0,
            'feedback': 'An error occurred during processing.',
          });
        }
      }

      if (mounted) {
        Navigator.pop(context);
        final userId = FirebaseAuth.instance.currentUser?.uid;
        saveInterviewFeedback(userId, localResults);
        _navigateToResultScreenWithResults(localResults);
      }
    });

  }

  void _clearHandlers() {
    UnityLauncher.setCompletionHandler((_) {});
  }

  void _navigateToResultScreenWithResults(List<Map<String, dynamic>> results) {
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        GoRouter.of(context).pushReplacement(
          AppRouter.kResult,
          extra: {'results': results},
        );
      }
    });
  }

  void _navigateToResultScreen() {
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        GoRouter.of(context).pushReplacement(
          AppRouter.kResult,
          extra: {
            'results': feedbackResults,
          },
        );
      }
    });
  }

  void startTimer() {
    interviewTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        if (remaining.inSeconds == 0) {
          timer.cancel();
          _navigateToResultScreen();
        } else {
          remaining -= const Duration(seconds: 1);
        }
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _isUnityActive) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && _isUnityActive) {
          debugPrint("⚠️ Emergency fallback triggered.");
          _isUnityActive = false;
          _navigateToResultScreen();
        }
      });
    }
  }

  Future<void> _launchUnity() async {
    try {
      debugPrint('🚀 Launching Unity interview...');
      setState(() {
        _isUnityActive = true;
        feedbackResults.clear();
      });

      await UnityLauncher.launchUnity();
      startTimer();
    } on PlatformException catch (e) {
      setState(() => _isUnityActive = false);
      debugPrint('❌ Unity launch error: ${e.message}');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to launch Unity: ${e.message}')),
        );
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    interviewTimer?.cancel();
    pageController.dispose();
    _clearHandlers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Constant.getHeight(context) * 0.08),
        const CustomGradientCircle(),
        SizedBox(height: Constant.getHeight(context) * 0.03),
        SizedBox(
          height: Constant.getHeight(context) * 0.14,
          child: InterviewPageView(
            controller: pageController,
            onPageChanged: (index) {
              if (mounted) {
                setState(() => currentPage = index);
              }
            },
          ),
        ),
        const Spacer(flex: 2),
        PageIndicator(controller: pageController),
        const Spacer(flex: 1),
        currentPage == 3
            ? NextButton(
          controller: pageController,
          text: 'Start Interview',
          onFinalPageAction: _launchUnity,
        )
            : NextButton(
          controller: pageController,
          text: 'Next',
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
