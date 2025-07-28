enum QuestionType { radio, checkbox }

class Question {
  final String questionText;
  final QuestionType type;
  final List<String> options;

  Question({
    required this.questionText,
    required this.type,
    required this.options,
  });
}
