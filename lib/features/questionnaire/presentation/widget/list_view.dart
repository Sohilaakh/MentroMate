import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentroverso/features/questionnaire/presentation/widget/questionnaire_container.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/themes.dart';

class QuestionListView extends StatefulWidget {
  const QuestionListView({super.key});

  @override
  _QuestionListViewState createState() => _QuestionListViewState();
}

class _QuestionListViewState extends State<QuestionListView> {
  List<Map<String, dynamic>> questions = [];
  Map<int, String> userResponses = {}; // Stores user responses
  bool showCorrectAnswers = false;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<void> fetchQuestions() async {
    List<Map<String, dynamic>> fetchedQuestions = [];
    List<String> kpis = ['/KPIs/1', '/KPIs/2', '/KPIs/3', '/KPIs/4']; // Define KPI categories

    for (String kpi in kpis) {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('Questions')
          .where('kpi', isEqualTo: kpi)
          .orderBy('question number')
          .limit(5) // Fetch only 5 questions per KPI
          .get();

      fetchedQuestions.addAll(querySnapshot.docs.map((doc) => doc.data()));
    }

    // Shuffle questions to randomize order
    fetchedQuestions.shuffle();

    setState(() {
      questions = fetchedQuestions;
      userResponses.clear(); // Reset user responses
      showCorrectAnswers = false; // Reset correct answer view
    });
  }

  void _submitAnswers() {
    int correctAnswers = 0;

    for (int i = 0; i < questions.length; i++) {
      if (userResponses[i] == questions[i]['correct answer']) {
        correctAnswers++;
      }
    }

    double score = (correctAnswers / questions.length) * 100;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Completed"),
        content: Text("Your Score: ${score.toStringAsFixed(2)}%"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                showCorrectAnswers = true;
              });
              Navigator.pop(context);
            },
            child: const Text("View Correct Answers"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: questions.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return QuestionContainer(
                  question: questions[index]['question'] ?? 'No question',
                  options: List<String>.from(questions[index]['possible answers'] ?? []),
                  onSelected: (selectedOption) {
                    setState(() {
                      userResponses[index] = selectedOption;
                    });
                  },
                  selectedOption: showCorrectAnswers ? questions[index]['correct answer'] : userResponses[index],
                );
              },
            ),
          ),
          Container(
            width: Constant.getWidth(context)*0.6,
            height: Constant.getHeight(context)*0.07,
            decoration: BoxDecoration(
              gradient:  LinearGradient(
                colors: [
                  ColorResources.darkMauve,
                  ColorResources.forestGreen,
                ],
                stops: [0.0,1.0],
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow:  [
                BoxShadow(
                  color: ColorResources.darkGray,
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: ElevatedButton(
              onPressed: userResponses.length == questions.length ? _submitAnswers : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Submit Answers",
                style: Styles.textStyle20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
