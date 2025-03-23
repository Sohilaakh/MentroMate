import 'package:mentroverso/features/questionnaire/domain/repositories/question_repository.dart';
import 'package:mentroverso/features/questionnaire/domain/entities/question.dart';

class GetQuestionsByKPI {
  final QuestionRepository repository;

  GetQuestionsByKPI(this.repository);

  Future<List<Question>> call() async {
    return await repository.getQuestionsByKPI();
  }
}
