import 'package:enigma/utils/authentication.dart';
import 'package:enigma/utils/custom_colors.dart';
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
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/firebase_logo.png',
                        height: 160,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Enigma Cryptograph',
                      style: TextStyle(
                        color: CustomColors.firebaseYellow,
                        fontSize: 28
                      ),
                    ),
                    Text(
                      'Authentication',
                      style: TextStyle(
                        color: CustomColors.firebaseOrange,
                        fontSize: 40
                      ),
                    )
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(),
                builder: (context, snapshot) {
                  if(snapshot.hasError) {
                    return Text(
                      'Error initializing Firebase'
                    );

                  } else if(snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();

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
    );
  }
}
