import 'package:firebase_flutter_kata/shared/widgets/questionnaire_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_flutter_kata/core/questionnaires/cms.dart';
import '../../success/pages/success_page.dart';

class QuestionnairePage extends StatelessWidget {
  final sections = cmsQuestionnaire;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionnaire'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: QuestionnaireForm(
            sections: sections,
            onFormSubmit: (data) {
              print('Form data: ${data.allAnswers}');
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SuccessPage()),
              );
            },
          ),
        ),
      ),
    );
  }
}
