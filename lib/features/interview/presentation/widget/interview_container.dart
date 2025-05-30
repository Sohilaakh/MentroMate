import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/themes.dart';

class InterviewContainer extends StatelessWidget {
  final String question;
  final String correctAnswer;
  final String userAnswer;
  final String score;
  final String feedback;

  const InterviewContainer({
    super.key,
    required this.question,
    required this.score,
    required this.correctAnswer,
    required this.feedback,
    required this.userAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question : $question',
            style: Styles.textStyle15,
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // 🛠️ fix alignment
            children: [
              Text(
                "🧑‍💻 Your Answer: $userAnswer",
                style: Styles.textStyle14Regular.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                "✅ Correct Answer: $correctAnswer",
                style: Styles.textStyle14Regular.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                "🎯 Score: $score",
                style: Styles.textStyle14Regular.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                "🔍 Feedback: $feedback",
                style: Styles.textStyle14Regular.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
