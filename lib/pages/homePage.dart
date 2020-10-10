import 'package:deneme_haberapp/pages/drawerPage.dart';
import 'package:deneme_haberapp/tabs/anasayfaPage.dart';
import 'package:deneme_haberapp/tabs/mkpHaberlerPage.dart';
import 'package:deneme_haberapp/tabs/sokDkPage.dart';
import 'package:deneme_haberapp/tabs/sporPage.dart';
import 'package:deneme_haberapp/tabs/teknolojiPage.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';

import 'denemePage.dart';
import 'ekle.dart';

class HomePage extends StatefulWidget {


  final String value;


  HomePage({Key key,this.value}) : super (key:key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadPhotoPage()));
        },
      ),
      drawer: DrawerPage(valuee: widget.value.toString()),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("Haber App"),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              text: "Anasayfa",
            ),
            Tab(text: "MKP"),
            Tab(text: "Son Dk"),
            Tab(text: "Teknoloji"),
            Tab(
              text: "Spor",
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,

        child: Container(
          child: Column(
            children: [
              Flexible(
                child: ExtendedTabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Anasayfa(),
                    MKPHaberler(),
                    SonDkPage(),
                    Teknoloji(),
                    SporPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}