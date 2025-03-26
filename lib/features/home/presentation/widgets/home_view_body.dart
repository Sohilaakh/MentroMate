import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/core/utils/assets.dart';
import 'package:mentroverso/features/home/presentation/widgets/info_card.dart';
import '../../../../core/utils/app_routes.dart';
import 'feature_card.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool showCorrectAnswers = false;
    List<String> suggestedCourses = [];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),

          const InfoCard(),
          const SizedBox(height: 24),
          FeatureCard(
            imagePath: AssetsData.questionnaire,
            title: 'Questionnaire',
            description: 'Discover your strengths and interests.',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kQuestionnaireView,extra:showCorrectAnswers );

            },
          ),

          const SizedBox(height: 18 ),
          FeatureCard(
            imagePath: AssetsData.chatbot,
            title: 'Chatbot',
            description: 'Get instant AI guidance',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kChatbotView, extra: suggestedCourses);

            },
          ),
          const SizedBox(height: 18),
          FeatureCard(
            imagePath: AssetsData.interview,
            title: 'Interview',
            description: 'Test your skills and get feedback.',
            onTap: () {
            GoRouter.of(context).push(AppRouter.kInterviewView);

            },
          ),
          const SizedBox(height: 18),
          FeatureCard(
            imagePath: AssetsData.meeting,
            title: 'Meeting',
            description: 'Discuss progress with your mentor',
            onTap: () {
              GoRouter.of(context).push(AppRouter.kMeetingView);
            },
          ),
          const SizedBox(height: 18),

        ],
      ),
    );
  }
}
