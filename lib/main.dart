import 'package:deneme_haberapp/pages/ekle.dart';
import 'package:deneme_haberapp/pages/homePage.dart';
import 'package:deneme_haberapp/pages/loginPage.dart';
import 'package:deneme_haberapp/tabs/anasayfaPage.dart';
import 'package:deneme_haberapp/tabs/sporPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main () async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return LoginRegister();
  }
}
