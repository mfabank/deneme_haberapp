import 'package:flutter/material.dart';

class SonDkPage extends StatefulWidget {
  @override
  _SonDkPageState createState() => _SonDkPageState();
}

class _SonDkPageState extends State<SonDkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff2e3f6f), Color(0xffabb3da)],
            begin: FractionalOffset(0.3, 1),
          ),
        ),
      ),
    );

  }
}
