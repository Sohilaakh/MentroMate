import 'package:flutter/material.dart';
import 'package:mentroverso/features/feedbacks/presentation/widgets/feedback_item.dart';

class FeedbacksListWidget extends StatelessWidget {
  // final List<Map<String, String>> feedbacks;

  const FeedbacksListWidget({
    super.key,
    // required this.feedbacks,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return FeedbackItem(
            text: 'Feedback of ${index + 1}st interview',
            onTap: () {},
          );
        },
      ),

    );
  }
}
