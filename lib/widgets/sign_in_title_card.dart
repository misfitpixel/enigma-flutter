import 'package:enigma/utils/custom_colors.dart';
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
        SizedBox(height: 20,),
        Text(
          'Enigma',
          style: TextStyle(
              color: CustomColors.firebaseYellow,
              fontSize: 28
          ),
        ),
      ],
    );
  }
}
