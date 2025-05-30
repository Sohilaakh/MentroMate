import 'package:flutter/material.dart';
import '../../../../core/widgets/build_page_text.dart';

class InterviewPageView extends StatelessWidget {
  final PageController controller;
  final Function(int) onPageChanged;

  const InterviewPageView({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children:  [
        BuildPageText(
          title: 'Welcome! Before you begin, here are a few quick things to know:',
          text1: '1. Time Limit: You’ll have 10 minutes to complete the interview.',
          text2: '2. Repeat Question: If you need to hear a question again, just press the Repeat button.',
        ),
        BuildPageText(
          title: 'Welcome! Before you begin, here are a few quick things to know:',
          text1: '3. Finish Answer: After you answer, press the Finish Answer button to move to the next question.',
          text2: '4. If the button is gray, it means your answer is being processed—please wait a few seconds.',
        ),
        BuildPageText(
          title: 'Welcome! Before you begin, here are a few quick things to know:',
          text1: '5. Some questions may start with "Design," "Implement," or "Create"—don’t worry! You’re not expected to write code.',
          text2: '6. focus on explaining your approach, reasoning, and structure out loud. For example, talk about the components you\'d use, how you\'d organize the system, or what factors you\'d consider to make it effective.',
        ),
        BuildPageText(title: 'Take a deep breath, speak clearly, and show your thinking. You\'re ready—good luck!'),
      ],
    );
  }
}
