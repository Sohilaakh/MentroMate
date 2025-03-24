import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentroverso/features/questionnaire/presentation/widget/questionnaire_button.dart';
import 'package:mentroverso/features/questionnaire/presentation/widget/questionnaire_container.dart';

import '../../domain/entities/question.dart';
import '../bloc/question_bloc.dart';
import '../bloc/question_event.dart';
import '../bloc/question_state.dart';


class QuestionListView extends StatefulWidget {
  const QuestionListView({super.key});

  @override
  _QuestionListViewState createState() => _QuestionListViewState();
}

class _QuestionListViewState extends State<QuestionListView> {
  Map<int, String> userResponses = {};
  bool showCorrectAnswers = false;

  @override
  void initState() {
    super.initState();
    context.read<QuestionBloc>().add(LoadQuestions());
  }

  void _submitAnswers(List<Question> questions) {
    print("Submit button pressed!");
    int correctAnswers = 0;

    for (int i = 0; i < questions.length; i++) {
      if (userResponses[i] == questions[i].correctAnswer) {
        correctAnswers++;
      }
    }

    double score = (correctAnswers / questions.length) * 100;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Quiz Completed"),
        content: Text("Your Score: ${score.toStringAsFixed(2)}%"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                showCorrectAnswers = true;
              });
              Navigator.pop(context);
            },
            child: const Text("View Correct Answers"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionBloc, QuestionState>(
      builder: (context, state) {
        if (state is QuestionLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is QuestionLoaded) {
          final questions = state.questions;

          return Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return QuestionContainer(
                        question: questions[index].question,
                        options: questions[index].options,
                        selectedOption: userResponses[index],
                        onSelected: (selectedOption) {
                          if (!showCorrectAnswers) {
                            setState(() {
                              userResponses[index] = selectedOption;
                            });
                          }
                        },
                        showCorrectAnswer: showCorrectAnswers,
                        correctAnswer: questions[index].correctAnswer,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: QuestionnaireButton(
                    userResponses: userResponses,
                    submitAnswers: () => _submitAnswers(questions), questions: [],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text("Failed to load questions"));
        }
      },
    );
  }
}
