class EvaluationResult {
  final double finalScore;
  final String feedback;
  final String userAnswer;
  final String correctAnswer;
  final Map<String, dynamic> metrics;

  EvaluationResult({
    required this.finalScore,
    required this.feedback,
    required this.userAnswer,
    required this.correctAnswer,
    required this.metrics,
  });

  factory EvaluationResult.fromJson(Map<String, dynamic> json) {
    return EvaluationResult(
      finalScore: json['final_score']?.toDouble() ?? 0.0,
      feedback: json['feedback'] ?? '',
      userAnswer: json['processed_inputs']['user_answer'] ?? '',
      correctAnswer: json['processed_inputs']['correct_answer'] ?? '',
      metrics: json['metrics'] ?? {},
    );
  }
}