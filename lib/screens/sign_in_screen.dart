import 'package:enigma/utils/authentication.dart';
import 'package:enigma/utils/custom_colors.dart';
import 'package:enigma/widgets/apple_sign_in_button.dart';
import 'package:enigma/widgets/google_sign_in_button.dart';
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
      backgroundColor: CustomColors.firebaseNavy,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                ),
                FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if(snapshot.hasError) {
                      return Text(
                        'Error initializing Firebase'
                      );

                    } else if(snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: [
                          GoogleSignInButton(),
                          AppleSignInButton()
                        ],
                      );

                    }

                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        CustomColors.firebaseOrange
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
