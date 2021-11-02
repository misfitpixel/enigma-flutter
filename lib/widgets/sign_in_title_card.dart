import 'package:enigma/themes/firebase_theme.dart';
import 'package:flutter/material.dart';

class SignInTitleCard extends StatelessWidget {
  const SignInTitleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/firebase_logo.png',
          height: 160,
        ),
        const SizedBox(height: 20,),
        Text(
          'Enigma',
          style: FirebaseTheme.titleStyle,
        ),
      ],
    );
  }
}
