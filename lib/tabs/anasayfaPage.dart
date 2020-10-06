import 'package:carousel_slider/carousel_slider.dart';
import 'package:deneme_haberapp/pages/drawerPage.dart';
import 'package:deneme_haberapp/tabs/sporPage.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  List deneme = [
    "İntihar Etti",
    "Balkondan atladı",
    "Kendine gel Beşiktaş",
    "Hadi İnşallah"
  ];
  List deneme2 = [
    "Hayattan keyif almadığını söyledi.",
    "Bu nasıl haber içeriği",
    "Beşiktaş küme düşecek diyorlar ",
    "Deneme1234123"
  ];
  int _current = 0;
  List imgList = [
    "https://cdn.pixabay.com/photo/2014/07/01/12/35/taxi-cab-381233_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/10/28/13/09/usa-1777986_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/09/08/12/00/starry-sky-1654074_960_720.jpg",
    "https://cdn.pixabay.com/photo/2015/11/07/12/02/business-man-1031755_960_720.jpg"
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      drawer: DrawerPage(),
      body: Container(
        height: double.infinity,
        width: double.infinity,

        child: Column(
          children: [
            Container(
              height: 120,
              width: 400,
              child: CarouselSlider(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  height: 180,
                  initialPage: 0,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  items: imgList.map((imgUrl) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(imgUrl),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.deepPurpleAccent,
                        ),
                      );
                    });
                  }).toList()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 5.0,
                  height: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 3.0),
                  decoration: BoxDecoration(

                    shape: BoxShape.circle,
                    color: _current == index ? Colors.red : Colors.blueGrey,
                  ),
                );
              }),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: deneme.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.red.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Card(

                      elevation: 20,
                      child: ListTile(
                        title: Text(deneme[index]),
                        subtitle: Text(deneme2[index]),
                        leading: Image.network(
                            "https://cdn.pixabay.com/photo/2015/11/07/12/02/business-man-1031755_960_720.jpg"),
                        dense: true,
                        onTap: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                            Colors.red.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                    ),
                    width: 200,
                    child: Card(

                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(15.0),
                      ),


                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.network(
                                "https://cdn.pixabay.com/photo/2015/11/07/12/02/business-man-1031755_960_720.jpg"),
                            title: Text('MKP Haber Portal', style: TextStyle(color: Colors.white)),
                            dense: true,
                          ),
                          Text("İntihar etti"),
                          Text("Bu hayat böyle yaşanmaz dedi"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
