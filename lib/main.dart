import 'package:enigma/screens/sign_in_screen.dart';
import 'package:enigma/themes/firebase_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enigma',
      debugShowCheckedModeBanner: false,
      theme: FirebaseTheme.themeData,
      home: const SignInScreen(),
    );
  }
}