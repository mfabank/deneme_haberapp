import 'package:deneme_haberapp/models/dialogBox.dart';
import 'package:deneme_haberapp/pages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _email, _pass;
  DialogBox dialogBox = DialogBox();
  final GlobalKey<FormState> _formkey = new GlobalKey<FormState>();
  var _control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffbebebe), Color(0xff79cdcd)],
            begin: FractionalOffset(0.3, 1),
          ),
        ),
        child: Column(
          children: [
            Column(
              children: [
                Form(
                  key: _formkey,
                  child: Container(
                    padding: EdgeInsets.only(top: 70),
                    margin: EdgeInsets.all(50),
                    width: 500,
                    height: 500,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.person,
                            size: 130,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Container(
                          width: 300,
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            controller: _control,
                            validator: (input) {
                              if (input.isEmpty) {
                                return "Lütfen emaili boş bırakmayınız";
                              }
                            },
                            onSaved: (input) => _email = input,
                            decoration: InputDecoration(
                              hintText: "Kullanıcı adı",
                              icon: Icon(
                                Icons.person,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          margin: EdgeInsets.only(top: 10),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return "Lütfen şifreyi boş bırakmayınız";
                              }
                            },
                            onSaved: (input) => _pass = input,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.blueGrey,
                                ),
                                hintText: "Parola"),
                            obscureText: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: RaisedButton(
                            child: Text("Kayıt ol"),
                            color: Colors.blueGrey[100],
                            onPressed: kayitOl,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Zaten üye misin ?"),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginRegister()));
                                  },
                                  child: Text(
                                    "Giriş Yap!",
                                    style: TextStyle(color: Colors.orange),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> kayitOl() async {
    final form = _formkey.currentState;

    if (form.validate()) {
      form.save();

      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _pass);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                  value: _control.text,
                )));
      } catch (e) {
        dialogBox.information(context, "Hatalı Giriş", "");
        return (e.toString());
      }
    }
  }
}