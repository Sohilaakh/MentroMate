import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/features/feedbacks/presentation/widgets/feedback_item.dart';

import '../../../../core/utils/app_routes.dart';

class FeedbacksListWidget extends StatelessWidget {
  const FeedbacksListWidget({super.key});

  Future<List<Map<String, dynamic>>> fetchUserFeedbacks() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("User not logged in.");
    }

    final snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .collection('interview_feedbacks')
        .orderBy('timestamp', descending: false)
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchUserFeedbacks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No feedbacks found.'));
        }

        final feedbacks = snapshot.data!;

        return Expanded(
          child: ListView.builder(
            itemCount: feedbacks.length,
            itemBuilder: (context, index) {
              return FeedbackItem(
                text: 'Feedback of ${index + 1}st interview',
                onTap: () {
                  final feedbackList = feedbacks[index]['feedback'];
                  if (feedbackList is List) {
                    GoRouter.of(context).push(
                      AppRouter.kResult,
                      extra: {'results': List<Map<String, dynamic>>.from(feedbackList)},
                    );
                  } else {
                    debugPrint("❌ Invalid feedback format.");
                  }
                },

              );
            },
          ),
        );
      },
    );
  }
}
