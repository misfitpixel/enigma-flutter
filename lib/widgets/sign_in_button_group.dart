import 'package:enigma/themes/firebase_theme.dart';
import 'package:enigma/utils/authentication.dart';
import 'package:enigma/widgets/apple_sign_in_button.dart';
import 'package:enigma/widgets/error_text.dart';
import 'package:enigma/widgets/google_sign_in_button.dart';
import 'package:flutter/material.dart';

class SignInButtonGroup extends StatelessWidget {
  const SignInButtonGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
          child: Row(
            children: [
              const Expanded(
                child: Divider(
                  color: Colors.white,
                )
              ),
              const SizedBox(width: 8),
              Text(
                'Get started',
                style: FirebaseTheme.subtitleStyle,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Divider(
                  color: Colors.white,
                )
              ),
            ],
          ),
        ),
        FutureBuilder(
          future: Authentication.initializeFirebase(context: context),
          builder: (context, snapshot) {
            if(snapshot.hasError) {
              return const ErrorText('Error initializing authentication servers');

            } else if(snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  children: [
                    GoogleSignInButton(),
                    SizedBox(height: 8,),
                    AppleSignInButton()
                  ],
                ),
              );
            }

            return CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  FirebaseTheme.firebaseOrange
              ),
            );
          },
        )
      ],
    );
  }
}
