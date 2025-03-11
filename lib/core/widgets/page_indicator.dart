import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../utils/color_resources.dart';

class PageIndicator extends StatelessWidget {
  final PageController controller;

  const PageIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: ExpandingDotsEffect(
        activeDotColor: ColorResources.darkMauve,
        dotColor: ColorResources.softWhite,
        dotHeight: 5,
        dotWidth: 7,
        expansionFactor: 6,
      ),
    );
  }
}