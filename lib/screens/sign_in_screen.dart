import 'package:enigma/themes/firebase_theme.dart';
import 'package:enigma/widgets/sign_in_button_group.dart';
import 'package:enigma/widgets/sign_in_title_card.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FirebaseTheme.firebaseNavy,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SignInTitleCard(),
                SignInButtonGroup(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
