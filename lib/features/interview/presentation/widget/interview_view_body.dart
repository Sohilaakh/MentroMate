import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/constants.dart';
import '../../../../core/widgets/page_indicator.dart';
import 'next_button.dart';
import 'page_view.dart';
import '../../../../core/widgets/custom_gradient_circle.dart';

class InterviewViewBody extends StatefulWidget {
  const InterviewViewBody({super.key});

  @override
  State<InterviewViewBody> createState() => _InterviewViewBodyState();
}

class _InterviewViewBodyState extends State<InterviewViewBody> {
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
          child: InterviewPageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        const Spacer(
          flex: 2
        ),
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
