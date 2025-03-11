import 'package:flutter/cupertino.dart';
import 'package:mentroverso/features/questionnaire/presentation/widget/questionnaire_page_view.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/widgets/custom_gradient_circle.dart';
import '../../../../core/widgets/page_indicator.dart';
import '../../../interview/presentation/widget/next_button.dart';

class QuestionnaireViewBody extends StatefulWidget {
  const QuestionnaireViewBody({super.key});

  @override
  State<QuestionnaireViewBody> createState() => _QuestionnaireViewBodyState();
}

class _QuestionnaireViewBodyState extends State<QuestionnaireViewBody> {
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
