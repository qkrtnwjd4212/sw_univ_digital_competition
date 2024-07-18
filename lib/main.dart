
import 'package:docent/screen/Heritage/HeritageListPage.dart';
import 'package:docent/screen/home/HomePage.dart';
import 'package:docent/screen/OAuth/interest_selection.dart';
import 'package:docent/screen/OAuth/login_UI.dart';
import 'package:docent/screen/docent_chat/generate_explanation.dart';
import 'package:docent/screen/docent_chat/play_explanation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await NaverMapSdk.instance.initialize(
    clientId: dotenv.env['NAVER_MAP_CLIENT_ID']!,
    onAuthFailed: (ex) {
      print("********* 네이버맵 인증오류 : $ex *********");
    },
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void main() async {
  await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SignInDemo(),
      title: 'Flutter Demo',
    );
  }
}


