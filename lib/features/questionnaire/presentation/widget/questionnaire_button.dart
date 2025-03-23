import 'package:flutter/material.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/themes.dart';

class QuestionnaireButton extends StatelessWidget {
  final Map<int, String> userResponses;
  final List<Map<String, dynamic>> questions;
  final VoidCallback submitAnswers;

  const QuestionnaireButton({
    super.key,
    required this.userResponses,
    required this.submitAnswers,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constant.getWidth(context) * 0.6,
      height: Constant.getHeight(context) * 0.07,
      decoration: BoxDecoration(
        color: ColorResources.mauve,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: ColorResources.darkGray,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          print("userResponses: ${userResponses.length}, questions: ${questions.length}"); // Debugging

          if (userResponses.length < questions.length) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Please answer all questions before submitting!")),
            );
          } else {
            submitAnswers();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          "Submit",
          style: Styles.textStyle20,
        ),
      ),
    );
  }
}
