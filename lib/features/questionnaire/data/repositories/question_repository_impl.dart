import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentroverso/features/questionnaire/domain/repositories/question_repository.dart';
import 'package:mentroverso/features/questionnaire/data/models/question_model.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final FirebaseFirestore firestore;

  QuestionRepositoryImpl(this.firestore);

  @override
  Future<List<QuestionModel>> getQuestionsByKPI() async {
    List<QuestionModel> questions = [];
    List<String> kpis = ['/KPIs/1', '/KPIs/2', '/KPIs/3', '/KPIs/4'];

    for (String kpi in kpis) {
      final querySnapshot = await firestore
          .collection('Questions')
          .where('kpi', isEqualTo: kpi)
          .get();

      List<QuestionModel> allQuestions = querySnapshot.docs
          .map((doc) => QuestionModel.fromMap(doc.data()))
          .toList();

      allQuestions.shuffle(); // Randomize questions
      questions.addAll(allQuestions.take(5)); // Select 5 random questions
    }
    return questions;
  }
}
