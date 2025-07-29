import 'package:firebase_flutter_kata/shared/models/question.dart';
import 'package:firebase_flutter_kata/shared/models/section.dart';
import 'package:firebase_flutter_kata/shared/models/answer_state.dart';
import 'package:flutter/material.dart';

class QuestionnaireForm extends StatefulWidget {
  final List<Section> sections;
  final Function(AnswerState) onFormSubmit;

  const QuestionnaireForm({
    super.key,
    required this.sections,
    required this.onFormSubmit,
  });

  @override
  State<QuestionnaireForm> createState() => _QuestionnaireFormState();
}

class _QuestionnaireFormState extends State<QuestionnaireForm> {
  final AnswerState _answerState = AnswerState();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...widget.sections.map(
          (section) => Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: _buildSection(section),
          ),
        ),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => {widget.onFormSubmit(_answerState)},
            child: const Text(
              'Submit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSection(Section section) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              section.title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (section.descriptionText != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(section.descriptionText!),
              ),
            const SizedBox(height: 16),
            ...section.questions.map(_buildQuestionWidget).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionWidget(Question question) {
    switch (question.type) {
      case QuestionType.radio:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.questionText,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ...question.options.map(
              (option) => RadioListTile<String>(
                title: Text(option, style: TextStyle(fontSize: 16)),
                value: option,
                groupValue: _answerState.getAnswer(question),
                onChanged: (value) {
                  setState(() {
                    _answerState.setAnswer(question, value);
                  });
                },
                contentPadding: EdgeInsets.zero,
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      case QuestionType.checkbox:
        final current = List<String>.from(
          _answerState.getAnswer(question) ?? [],
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.questionText,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            ...question.options.map((option) {
              final isChecked = current.contains(option);
              return CheckboxListTile(
                title: Text(option, style: const TextStyle(fontSize: 16)),
                value: isChecked,
                onChanged: (checked) {
                  setState(() {
                    if (checked == true) {
                      current.add(option);
                    } else {
                      current.remove(option);
                    }
                    _answerState.setAnswer(question, current);
                  });
                },
                contentPadding: EdgeInsets.zero,
              );
            }),
            const SizedBox(height: 16),
          ],
        );
    }
  }
}
