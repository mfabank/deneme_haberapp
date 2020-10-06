import 'package:deneme_haberapp/models/dialogBox.dart';
import 'package:deneme_haberapp/pages/registerPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'homePage.dart';

class LoginRegister extends StatefulWidget {
  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
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
                            controller:_control ,
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
                            child: Text("Giriş Yap"),
                            color: Colors.blueGrey[100],
                            onPressed: girisYap,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Üye değil misin ?"),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterPage()));
                                  },
                                  child: Text(
                                    "Hemen ol!",
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
  Future<void> girisYap() async {
    final form = _formkey.currentState;

    if (form.validate()) {

      form.save();

      try{
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _pass);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage(value: _control.text,)));


      }
      catch(e){
        dialogBox.information(context, "Hatalı Giriş", "Kullanıcı adı ve ya Şifre hatalı");
        print(e.toString());
      }
    }
  }
}