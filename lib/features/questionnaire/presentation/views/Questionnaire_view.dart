import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/core/widgets/custom_app_bar.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/linear_gradient_back_ground_color.dart';
import '../widget/questionnaire_view_body.dart';

class QuestionnaireView extends StatelessWidget {
  bool showCorrectAnswers;
  QuestionnaireView({super.key, required this.showCorrectAnswers});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      LinearGradientBackGroundColor(
        beginColor: Alignment.bottomLeft,
        endColor: Alignment.topRight,
      ),
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            title: 'Questions',
            onIconPressed: () {
              GoRouter.of(context).pop(AppRouter.kHome);
            },
          ),
          body: QuestionnaireViewBody(showCorrectAnswers: showCorrectAnswers,)),
    ]);
  }
}
