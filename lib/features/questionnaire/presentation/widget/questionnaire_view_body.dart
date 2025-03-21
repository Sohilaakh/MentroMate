import 'package:flutter/cupertino.dart';

import 'list_view.dart';

class QuestionnaireViewBody extends StatelessWidget {
  const QuestionnaireViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionListView()
      ],
    );
  }
}
