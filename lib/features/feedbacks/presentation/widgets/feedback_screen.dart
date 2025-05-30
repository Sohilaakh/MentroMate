import 'package:flutter/material.dart';
import 'package:mentroverso/features/home/presentation/widgets/home_app_bar.dart';
import 'package:mentroverso/features/interview/presentation/widget/interview_container.dart';

import '../../../../core/widgets/linear_gradient_back_ground_color.dart';



class FeedbackScreen extends StatefulWidget {
  final List<Map<String, dynamic>>? results;

  const FeedbackScreen({super.key, this.results});

  @override
  State<FeedbackScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<FeedbackScreen> {


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    if (widget.results == null || widget.results!.isEmpty) {
      return const Scaffold(body: Center(child: Text("No results available")));
    }

    return Stack(
      children: [
        LinearGradientBackGroundColor(
          beginColor: Alignment.bottomLeft,
          endColor: Alignment.topRight,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar:HomeAppBar(),
          body: Column(
              children: [Expanded(
                child: ListView.builder(
                  itemCount: widget.results!.length,
                  itemBuilder: (context, index) {
                    var res = widget.results![index];
                    var qText = res['question_text'] ?? 'Loading...';
                    return InterviewContainer(question: qText,
                        score: "${res['score']}%",
                        correctAnswer: res['correct_answer'],
                        feedback:res['feedback'],
                        userAnswer: res['user_answer']);
                  },
                ),
              ),
              ]
          ),

        )
      ],
    );
  }
}
