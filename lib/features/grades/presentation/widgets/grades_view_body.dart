import 'package:flutter/material.dart';
import 'package:mentroverso/core/utils/assets.dart';

import '../../../growing/presentation/widgets/motivational_banner.dart';

class GradesViewBody extends StatelessWidget {
  const GradesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 36),
          MotivationalBanner(
            text: '"Your Questionnaire Score!"',
            imagePath: AssetsData.grads,
          ),
        ],
      ),
    );
  }
}
