import 'package:firebase_flutter_kata/features/questionnaire/pages/questionnaire_page.dart';
import 'package:firebase_flutter_kata/shared/widgets/patient_info_form.dart';
import 'package:flutter/material.dart';

class PatientInfoPage extends StatelessWidget {
  const PatientInfoPage({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Information'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: PatientInfoForm(
            onFormSubmit: (data) {
              print('Patient data: $data');
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => QuestionnairePage()),
              );
            },
          ),
        ),
      ),
    );
  }
}
