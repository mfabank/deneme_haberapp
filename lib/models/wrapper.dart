
import 'package:deneme_haberapp/models/user.dart';
import 'package:deneme_haberapp/pages/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if(user == null){
      return Authentication();
    }else {
      return HomePage();
    }

    return Authentication();
  }
}
