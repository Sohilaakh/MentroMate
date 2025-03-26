import 'package:flutter/cupertino.dart';

import 'list_view.dart';

class QuestionnaireViewBody extends StatelessWidget {
  bool showCorrectAnswers;
  QuestionnaireViewBody({super.key, required this.showCorrectAnswers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionListView(showCorrectAnswers: showCorrectAnswers,)
      ],
    );
  }
}
