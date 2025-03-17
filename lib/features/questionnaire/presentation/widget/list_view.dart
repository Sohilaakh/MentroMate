import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentroverso/features/questionnaire/presentation/widget/questionnaire_container.dart';

class QuestionListView extends StatelessWidget {
  const QuestionListView({super.key});

  Future<List<Map<String, dynamic>>> fetchQuestions() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Questions')
        .orderBy('question number') // Ensures ordered retrieval
        .get();

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchQuestions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No questions available.'));
          }

          final questions = snapshot.data!;

          return ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              final questionData = questions[index];
              return QuestionContainer(
                question: questionData['question'] ?? 'No question',
                options: List<String>.from(questionData['possible answers'] ?? []),
                onSelected: (selectedOption) {},
              );
            },
          );
        },
      ),
    );
  }
}
