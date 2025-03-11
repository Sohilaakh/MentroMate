import 'package:flutter/material.dart';

import 'feedback_card.dart';
import 'feedback_list_widget_.dart';

class FeedBackViewBody extends StatelessWidget {
  const FeedBackViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          FeedbackCard(),
          SizedBox(height: 40),
          FeedbacksListWidget()

        ],
      ),
    );
  }
}
