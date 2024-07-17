import 'package:docent/screen/HomePage.dart';
import 'package:docent/screen/OAuth/interest_selection.dart';
import 'package:docent/screen/OAuth/login_UI.dart';
import 'package:docent/screen/docent_chat/generate_explanation.dart';
import 'package:docent/screen/docent_chat/play_explanation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CulturalHeritageScreen(),
    );
  }
}
