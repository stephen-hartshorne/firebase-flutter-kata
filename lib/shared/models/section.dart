import 'package:firebase_flutter_kata/shared/models/question.dart';

class Section {
  final String title;
  final List<Question> questions;
  final String? descriptionText;

  Section({required this.title, required this.questions, this.descriptionText});
}
