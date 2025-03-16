import 'package:flutter/material.dart';
import 'package:mentroverso/features/questionnaire/presentation/widget/questionnaire_container.dart';

class QuestionListView extends StatelessWidget {
  const QuestionListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,

        itemBuilder: (context, index) {
          return QuestionContainer(
            question: 'question',
            options: ['Red', 'Blue', 'Green', 'Yellow'],
            onSelected: (selectedOption) {},
          );
        },
      ),
    );
  }
}
