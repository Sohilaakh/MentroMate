import 'package:flutter/material.dart';
import '../../../../core/widgets/build_page_text.dart';

class QuestionnairePageView extends StatelessWidget {
  final PageController controller;
  final Function(int) onPageChanged;

  const QuestionnairePageView({
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
          title: 'There are some guidelines:',
          text1: '1. Make sure you are in a quiet place.',
          text2: '2. Test your camera and microphone.',
        ),
        BuildPageText(
          title: 'There are some guidelines:',
          text1: '3. Prepare answers for common questions.',
          text2: '4. Dress professionally and stay confident.',
        ),
        BuildPageText(title: 'Are you Ready ?'),
      ],
    );
  }
}
