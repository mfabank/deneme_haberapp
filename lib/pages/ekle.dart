import 'package:flutter/material.dart';

class YaziEkle extends StatefulWidget {
  @override
  _YaziEkleState createState() => _YaziEkleState();
}

class _YaziEkleState extends State<YaziEkle> {
  String title, subtitle, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Form(
                child: Column(
                  children: [
                    Container(),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return "Lütfen başlığı boş bırakmayınız";
                        }
                      },
                      onSaved: (input) => title = input,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.blueGrey,
                          ),
                          hintText: "başlık giriniz"),
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return "Lütfen alt başlığı boş bırakmayınız";
                        }
                      },
                      onSaved: (input) => subtitle = input,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.blueGrey,
                          ),
                          hintText: "alt başlık giriniz"),
                    ),
                    TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return "Lütfen içeriği boş bırakmayınız ";
                        }
                      },
                      onSaved: (input) => content = input,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.blueGrey,
                          ),
                          hintText: "içerik giriniz"),
                    ),
                  ],
                ))));
  }
}