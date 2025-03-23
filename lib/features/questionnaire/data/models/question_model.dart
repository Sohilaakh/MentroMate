import 'package:mentroverso/features/questionnaire/domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel({
    required super.question,
    required super.options,
    required super.correctAnswer,
  });

  // Convert Firestore data (Map) to a QuestionModel
  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['question'] ?? '',
      options: List<String>.from(map['possible answers'] ?? []),
      correctAnswer: map['correct answer'] ?? '',
    );
  }

  // Convert QuestionModel to Map (if needed)
  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'possible answers': options,
      'correct answer': correctAnswer,
    };
  }
}
