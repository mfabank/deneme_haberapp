import 'package:deneme_haberapp/pages/loginPage.dart';
import 'package:deneme_haberapp/pages/registerPage.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  bool showSignIn = true;
  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toogleView: toggleView);
    }
    else {
      return Register(toogleView: toggleView);
    }
  }
}
