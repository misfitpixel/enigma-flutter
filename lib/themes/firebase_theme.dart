import 'package:flutter/material.dart';

class FirebaseTheme {
  static final Color firebaseNavy = Color(0xFF2C384A);
  static final Color firebaseOrange = Color(0xFFF57C00);
  static final Color firebaseAmber = Color(0xFFFFA000);
  static final Color firebaseYellow = Color(0xFFFFCA28);
  static final Color firebaseGrey = Color(0xFFECEFF1);
  static final Color googleBackground = Color(0xFF4285F4);

  static final ThemeData themeData = ThemeData(
      primarySwatch: Colors.indigo,
      brightness: Brightness.dark
  );

  static final TextStyle titleStyle = TextStyle(
      color: FirebaseTheme.firebaseYellow,
      fontSize: 28
  );

  static final TextStyle subtitleStyle = TextStyle(
      fontSize: 16
  );

  static final TextStyle errorStyle = TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold
  );

  static final ButtonStyle googleStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          )
      ),
      overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.15))
  );

}