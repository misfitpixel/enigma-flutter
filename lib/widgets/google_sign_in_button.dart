import 'package:enigma/screens/user_info_screen.dart';
import 'package:enigma/utils/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
              )
          ),
          overlayColor: MaterialStateProperty.all(Colors.black.withOpacity(0.15))
        ),
        onPressed: () async {
          setState(() {
            _isSigningIn = true;
          });

          User? user = await Authentication.signInWithGoogle(context: context);

          setState(() {
            _isSigningIn = false;
          });

          if(user != null) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => UserInfoScreen(user: user)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/google_logo.png'),
                height: 24,
              ),
              SizedBox(width: 12,),
              Text(
                'Sign in with Google',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 16
                ),
              )
            ],
          ),
        )
    );
  }
}
