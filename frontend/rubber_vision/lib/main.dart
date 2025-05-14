import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rubber_vision/firebase_options.dart';
import 'package:rubber_vision/pages/login_screen.dart';
import 'package:rubber_vision/pages/tflite_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await TFLiteHelper.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          // ignore: deprecated_member_use
          fillColor: Colors.grey.withOpacity(0.1),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}