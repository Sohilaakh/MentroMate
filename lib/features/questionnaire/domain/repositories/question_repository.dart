import 'package:mentroverso/features/questionnaire/domain/entities/question.dart';

abstract class QuestionRepository {
  Future<List<Question>> getQuestionsByKPI();
}
