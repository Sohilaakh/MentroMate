import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentroverso/features/home/presentation/widgets/info_card.dart';

import '../widgets/feature_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 21),
          const InfoCard(),
          const SizedBox(height: 24),
          FeatureCard(
            imagePath: '',
            title: 'Questionnaire',
            description: 'Discover your strengths and interests.',
            onTap: () {},
          ),
          const SizedBox(height: 24),
          FeatureCard(
            imagePath: '',
            title: 'Interview',
            description: 'Test your skills and get feedback.',
            onTap: () {},
          ),
          const SizedBox(height: 24),
          FeatureCard(
            imagePath: '',
            title: 'Meeting',
            description: 'Discuss progress with your mentor',
            onTap: () {},
          ),
          const SizedBox(height: 24),
           FeatureCard(
            imagePath: '',
            title: 'Chatbot',
            description: 'Get instant AI guidance',
            onTap: () {},
          ),
          const SizedBox(height: 24),

        ],
      ),
    );
  }
}
