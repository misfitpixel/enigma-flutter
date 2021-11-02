import 'package:enigma/themes/firebase_theme.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String message;

  const ErrorText(this.message);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.report_gmailerrorred_rounded,
          color: Colors.red,
        ),
        const SizedBox(width: 4,),
        Text(
          message,
          style: FirebaseTheme.errorStyle,
        )
      ],
    );
  }
}
