import 'package:deneme_haberapp/models/auth.dart';
import 'package:deneme_haberapp/pages/homePage.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  final String valuee, isim, soyad, yas;

  DrawerPage({Key key, this.valuee, this.isim, this.soyad, this.yas})
      : super(key: key);
  // ignore: deprecated_member_use



  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.blueGrey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2014/04/03/10/32/businessman-310819_960_720.png"),
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  "${widget.valuee}",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Text(
                  "${widget.isim}",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Text(
                  "${widget.soyad}",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Text(
                  "${widget.yas}",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              "Profil",
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text("Profili düzenle"),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "Ayarlar",
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text("Bildirim ayarları"),
            onTap: null,
          ),
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Çıkış"),
            onPressed: () async {
              await _auth.singOut();
            },
          )
        ],
      ),
    );
  }
}
