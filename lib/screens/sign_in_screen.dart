import 'package:enigma/utils/authentication.dart';
import 'package:enigma/utils/custom_colors.dart';
import 'package:enigma/widgets/apple_sign_in_button.dart';
import 'package:enigma/widgets/google_sign_in_button.dart';
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
      backgroundColor: CustomColors.firebaseNavy,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SignInTitleCard(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.white,
                            )
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Get started',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
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
                          return Text(
                              'Error initializing Firebase'
                          );

                        } else if(snapshot.connectionState == ConnectionState.done) {
                          //return GoogleSignInButton();
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
                              CustomColors.firebaseOrange
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
