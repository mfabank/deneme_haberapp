import 'package:flutter/material.dart';

class SporPage extends StatefulWidget {
  @override
  _SporPageState createState() => _SporPageState();
}

class _SporPageState extends State<SporPage> {
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
