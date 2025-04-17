import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mentroverso/core/utils/app_routes.dart';
import 'package:mentroverso/features/questionnaire/presentation/widget/questionnaire_button.dart';
import 'package:mentroverso/features/questionnaire/presentation/widget/questionnaire_container.dart';

import '../../domain/entities/question.dart';
import '../bloc/question_bloc.dart';
import '../bloc/question_event.dart';
import '../bloc/question_state.dart';


class QuestionListView extends StatefulWidget {
  bool showCorrectAnswers = true;
   QuestionListView({super.key, required this.showCorrectAnswers});

  @override
  _QuestionListViewState createState() => _QuestionListViewState();
}

class _QuestionListViewState extends State<QuestionListView> {
  Map<int, String> userResponses = {};
  List<String> _wrongCourses = [];



  @override
  void initState() {
    super.initState();
    context.read<QuestionBloc>().add(LoadQuestions());
  }
  void _submitAnswers(List<Question> questions) {
    print("Submit button pressed!");
    int correctAnswers = 0;
    List<String> suggestedCourses = []; // ✅ Store courses

    for (int i = 0; i < questions.length; i++) {
      if (userResponses[i] == questions[i].correctAnswer) {
        correctAnswers++;
      } else {
        suggestedCourses.add(questions[i].relatedCourse); // ✅ Store wrong answer's course
      }
    }

    double score = (correctAnswers / questions.length) * 100;


    context.push(
      AppRouter.kScore,
      extra: {
        'score': score,
        'suggestedCourses': suggestedCourses,
        // ✅ Pass courses
      },
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
                          if (!widget.showCorrectAnswers) {
                            setState(() {
                              userResponses[index] = selectedOption;
                            });
                          }
                        },
                        showCorrectAnswer: widget.showCorrectAnswers,
                        correctAnswer: questions[index].correctAnswer, index: index,
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


