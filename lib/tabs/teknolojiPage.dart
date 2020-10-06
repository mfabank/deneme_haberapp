import 'package:flutter/material.dart';

class Teknoloji extends StatefulWidget {
  @override
  _TeknolojiState createState() => _TeknolojiState();
}

class _TeknolojiState extends State<Teknoloji> {
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
