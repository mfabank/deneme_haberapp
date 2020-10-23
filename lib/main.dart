import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/auth.dart';
import 'models/user.dart';
import 'models/wrapper.dart';

void main () {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        // value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
