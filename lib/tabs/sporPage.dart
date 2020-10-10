import 'package:deneme_haberapp/models/posts.dart';
import 'package:deneme_haberapp/pages/haberDetay.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SporPage extends StatefulWidget {
  @override
  _SporPageState createState() => _SporPageState();
}

class _SporPageState extends State<SporPage> {
  List<Posts> postsList = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference postsRef =
        FirebaseDatabase.instance.reference().child("Posts");
    postsRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;
      postsList.clear();
      for (var individualKey in KEYS) {
        if (DATA[individualKey]["category"] == "Spor") {
          Posts posts = Posts(
            DATA[individualKey]["image"],
            DATA[individualKey]["description"],
            DATA[individualKey]["date"],
            DATA[individualKey]["time"],
            DATA[individualKey]["category"],
          );
          postsList.add(posts);
        }
      }
      setState(() {
        print("Length : $postsList.length");
      });
    });
  }

  Posts seciliHaber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: postsList.length,
              itemBuilder: (context, index) {

                return ListTile(
                  title: Text(postsList[index].description),
                  subtitle: Text(postsList[index].category),
                  onTap: () {
                    this.seciliHaber = postsList[index];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HaberDetay(
                                postsList[index].image,
                                postsList[index].description,
                                postsList[index].date,
                                postsList[index].time)));
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
