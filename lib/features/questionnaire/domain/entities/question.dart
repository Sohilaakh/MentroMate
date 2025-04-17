// class Question {
//   final String question;
//   final List<String> options;
//   final String correctAnswer;
//
//   Question({
//     required this.question,
//     required this.options,
//     required this.correctAnswer,
//   });
//
//   factory Question.fromMap(Map<String, dynamic> map) {
//     return Question(
//       question: map['question'] ?? '',
//       options: List<String>.from(map['possible answers'] ?? []),
//       correctAnswer: map['correct answer'] ?? '',
//     );
//   }
// }
class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final String relatedCourse; // New field for course name
  final String kpi;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.relatedCourse,
    required this.kpi// Add to constructor
  });

  // Convert Firestore data (Map) to a Question instance
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['question'] ?? '',
      options: List<String>.from(map['possible answers'] ?? []),
      correctAnswer: map['correct answer'] ?? '',
      relatedCourse: map['course'] ?? '',
      kpi: map['kpi'] ?? ''
      // Ensure this key exists in Firestore
    );
  }

  // Convert Question object to Map (if needed for Firestore storage)
  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'possible answers': options,
      'correct answer': correctAnswer,
      'course': relatedCourse,
      'kpi' : kpi,// Include related course in Firestore
    };
  }
}
