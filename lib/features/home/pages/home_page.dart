import 'package:firebase_flutter_kata/features/questionnaire/pages/questionnaire_page.dart';
import 'package:flutter/material.dart';
import '../../patient_info/pages/patient_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home', style: TextStyle(color: Colors.deepOrange))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home, size: 100, color: Colors.deepOrange),
            const SizedBox(height: 16),
            const Text(
              'Community Resource Assessment',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF6A1B9A)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            const SizedBox(
              width: 800, 
              child: const Card(
                margin: EdgeInsets.all(32),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                  children: [
                    Text(
                      'Welcome to your health and social needs screening. This short questionnaire helps us understand not just your medical needs, but also the social factors that affect your health and wellbeing.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Research shows that things like housing, food security, transportation, and financial stability have a huge impact on your health outcomes. By understanding your complete picture, we can better support you and connect you with valuable community resources.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  ),
                ),
              )
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PatientInfoPage()),
                );
              },
              label: const Text('Click here to get started!', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => QuestionnairePage()),
                );
              },
              label: const Text('debug'),
            ),
          ],
        ),
      ),
    );
  }
}
