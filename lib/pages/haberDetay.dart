import 'package:deneme_haberapp/models/posts.dart';
import 'package:deneme_haberapp/tabs/anasayfaPage.dart';
import 'package:flutter/material.dart';

class HaberDetay extends StatefulWidget {
  String gelenHaber;
  String gelenDetay;
  String gelenHaberSon;
  String gelenFoto;
  /*String category;*/

  HaberDetay(this.gelenFoto,this.gelenHaber,this.gelenDetay,this.gelenHaberSon);
  /*HaberDetay.WithCategory(this.gelenFoto,this.gelenHaber,this.gelenDetay,this.gelenHaberSon,this.category);*/
  @override
  _HaberDetayState createState() => _HaberDetayState();
}

class _HaberDetayState extends State<HaberDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Haber Detay Sayfası"),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        leading: Icon(Icons.person),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: 400,
              height: 400,
              child: Column(
                children: [
                  Container(

                    child: Image.network("${widget.gelenFoto}"),
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 15,),
                  Text("${widget.gelenHaber}"),
                  SizedBox(height: 20,),
                  Text("${widget.gelenDetay}"),
                  SizedBox(height: 15,),
                  Text("${widget.gelenHaberSon}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
