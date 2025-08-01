import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/home/pages/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Flutter Kata',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple.shade800),
        textTheme: GoogleFonts.robotoTextTheme(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
