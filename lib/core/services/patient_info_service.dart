import 'package:cloud_firestore/cloud_firestore.dart';

class PatientInfoService {
  final db = FirebaseFirestore.instance;

  createPatient(data) async {
    // ideally would validate data and ensure its properly formatted
    try {
      await db.collection('patients').add({
        ...data,
        'createdAt': FieldValue.serverTimestamp(),
      });
      print('Patient data saved successfully');
    } catch (e) {
      print('Error saving patient data: $e');
    }
  }
}
