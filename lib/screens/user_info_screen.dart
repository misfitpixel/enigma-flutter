import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:enigma/screens/sign_in_screen.dart';
import 'package:enigma/themes/firebase_theme.dart';
import 'package:enigma/utils/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatefulWidget {
  final User _user;

  const UserInfoScreen({Key? key, required User user}) :
    _user = user,
    super(key: key)
  ;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1, 0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
    );
  }

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /**
     * TODO: remove!
     */
    _user.getIdToken().then((value) => {
      log(value)
    });

    return Scaffold(
      backgroundColor: FirebaseTheme.firebaseNavy,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: FirebaseTheme.firebaseNavy,
        title: Text(
          'Enigma'
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              _user.photoURL != null ?
                  ClipOval(
                    child: Material(
                      color: FirebaseTheme.firebaseGrey.withOpacity(0.3),
                      child: Image.network(
                        _user.photoURL!,
                        fit: BoxFit.fitHeight
                      ),
                    ),
                  ) :
                  ClipOval(
                    child: Material(
                      color: FirebaseTheme.firebaseGrey.withOpacity(0.3),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: FirebaseTheme.firebaseGrey,
                        ),
                      ),
                    ),
                  ),
              SizedBox(height: 16),
              Text(
                'Hello',
                style: TextStyle(
                  color: FirebaseTheme.firebaseGrey,
                  fontSize: 26
                ),
              ),
              SizedBox(height: 8,),
              Text(
                _user.displayName!,
                style: TextStyle(
                  color: FirebaseTheme.firebaseYellow,
                  fontSize: 26
                ),
              ),
              SizedBox(height: 8,),
              Text(
                '(${_user.email!})',
                style: TextStyle(
                  color: FirebaseTheme.firebaseOrange,
                  fontSize: 20,
                  letterSpacing: 0.5
                ),
              ),
              SizedBox(height: 24),
              Text(
                'You are now signed in using your Google account. To sign out of your account, click the "Sign Out" button below.',
                style: TextStyle(
                  color: FirebaseTheme.firebaseGrey.withOpacity(0.8),
                  fontSize: 14,
                  letterSpacing: 0.2
                ),
              ),
              SizedBox(height: 16,),
              _isSigningOut ?
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ) :
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.redAccent
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      )
                    ),
                    onPressed: () async {
                      setState(() {
                        _isSigningOut = true;
                      });

                      await Authentication.signOut(context: context);

                      setState(() {
                        _isSigningOut = false;
                      });
                      
                      Navigator.of(context).pushReplacement(_routeToSignInScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2
                        ),
                      ),
                    ),
                  ),
              ElevatedButton(
                onPressed: () async {
                  FirebaseFunctions instance = FirebaseFunctions.instanceFor(region: 'northamerica-northeast1');
                  HttpsCallable callable = instance.httpsCallable('generateSeed');

                  final results = await callable();
                  print(results.data);
                },
                child: Text(
                  'GenerateSeed'
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
