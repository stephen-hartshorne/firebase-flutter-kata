import 'package:firebase_flutter_kata/shared/models/question.dart';

class AnswerState {
  final Map<Question, dynamic> _answers = {};

  void setAnswer(Question question, dynamic value) {
    _answers[question] = value;
  }

  dynamic getAnswer(Question question) {
    return _answers[question];
  }

  Map<Question, dynamic> get allAnswers => _answers;
}
