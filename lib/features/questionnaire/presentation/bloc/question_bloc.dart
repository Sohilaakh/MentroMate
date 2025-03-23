import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/get_questions_by_kpi.dart';
import 'question_event.dart';
import 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final GetQuestionsByKPI getQuestionsByKPI;

  QuestionBloc(this.getQuestionsByKPI) : super(QuestionInitial()) {
    on<LoadQuestions>(_onLoadQuestions);
  }

  Future<void> _onLoadQuestions(LoadQuestions event, Emitter<QuestionState> emit) async {
    emit(QuestionLoading());
    try {
      final questions = await getQuestionsByKPI();
      emit(QuestionLoaded(questions));
    } catch (e) {
      emit(QuestionError("Failed to load questions"));
    }
  }
}
