import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/features/questionnaire/presentation/views/questionnaire_page_view.dart';
import 'package:mentroverso/features/questionnaire/presentation/views/Questionnaire_view.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/custom_gradient_circle.dart';
import '../../../../core/widgets/page_indicator.dart';
import '../../../interview/presentation/widget/next_button.dart';

class QuestionnairePageViewBody extends StatefulWidget {
  const QuestionnairePageViewBody({super.key});

  @override
  State<QuestionnairePageViewBody> createState() => _QuestionnairePageViewBodyState();
}

class _QuestionnairePageViewBodyState extends State<QuestionnairePageViewBody> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Constant.getHeight(context) * 0.08),
        const CustomGradientCircle(),
        SizedBox(height: Constant.getHeight(context) * 0.03),
        SizedBox(
          height: Constant.getHeight(context) * 0.14,
          child: QuestionnairePageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(
                () {
                  currentPage = index;
                },
              );
            },
          ),
        ),
        const Spacer(flex: 2),
        PageIndicator(controller: pageController),
        const Spacer(flex: 1),
        currentPage == 2
            ? NextButton(
                controller: pageController,
                text: 'Start',
                onFinalPageAction: () {
                  GoRouter.of(context).push(AppRouter.kTestPage);
                },
              )
            : NextButton(
                controller: pageController,
                text: 'Next',
              ),
        const Spacer(flex: 2),
      ],
    );
  }
}
