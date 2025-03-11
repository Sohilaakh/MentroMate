import 'package:flutter/material.dart';
import '../../../../core/widgets/gradient_button.dart';

class NextButton extends StatelessWidget {
  final PageController controller;
  final String text;

  const NextButton({super.key, required this.controller , required this.text});

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      text: text,
      onPressed: () {
        if (controller.page?.toInt() == 2) {
          // Final page action
        } else {
          controller.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }
}