import 'package:deneme_haberapp/tabs/anasayfaPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class UploadPhotoPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _UploadPhotoPageState();
  }
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  File sampleImage;

  // ignore: unused_field
  String _myValue;
  String _myValue2;
  String _myValue3;
  String url;
  final formKey = GlobalKey<FormState>();
  String dropdownValue = 'Spor';

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      sampleImage = tempImage;
    });
  }


  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void uploadStatusImage() async {
    if (validateAndSave()) {
      final StorageReference postImageRef =
      FirebaseStorage.instance.ref().child("Posts");
      var timeKey = DateTime.now();
      final StorageUploadTask uploadTask =
      postImageRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);
      var ImageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      url = ImageUrl.toString();
      print("Image Url = " + url);

      goToHomePage();
      saveToDatabase(url);
    }
  }

  void saveToDatabase(url) {
    var dbTimeKey = DateTime.now();
    var formatDate = DateFormat("MMM d, yyyy");
    var formatTime = DateFormat("EEEE hh:mm aaa");

    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "image": url,
      "description": _myValue,
      "date": _myValue2,
      "time": _myValue3,
    };
    ref.child("Posts").push().set(data);
  }

  void goToHomePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Anasayfa();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Haber Ekle"),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(

                width: 200,
                height: 200,
                child: sampleImage == null ? Center(child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQaAMhb-ax7UpxCRlDB9a2IGCsDHS45zdKcPA&usqp=CAU",width: 200,height: 200,fit: BoxFit.fill,)) : enableUpload(),

              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Haber Başlığı"),
                validator: (value) {
                  return value.isEmpty ? "Haber başlığını giriniz" : null;
                },
                onSaved: (value) {
                  return _myValue = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(

                  hintText: "Haber özetini giriniz",
                  labelText: "Özet",
                  isDense: true,
                ),
                validator: (value) {
                  return value.isEmpty ? "Haber özetini giriniz" : null;
                },
                onSaved: (value) {
                  return _myValue2 = value;
                },
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Haberi metnini giriniz",
                  ),
                  validator: (value) {
                    return value.isEmpty ? "Haber başlığını giriniz" : null;
                  },
                  onSaved: (value) {
                    return _myValue3 = value;
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,

                ),
              ),
          Container(
            padding: EdgeInsets.only(left: 240,bottom:80),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.category),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['Spor', 'Ekonomi', 'Cinayet', 'Siyaset']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
              RaisedButton(
                elevation: 10.0,
                child: Text("Haberi Ekle"),
                textColor: Colors.white,
                color: Colors.deepPurpleAccent,
                onPressed: uploadStatusImage,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: "Fotoğraf Ekle",
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget enableUpload() {
    return SingleChildScrollView(
      child: Container(
        child: Form(

          child: Column(
            children: [
              Image.file(
                sampleImage,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.fill,
              ),

            ],
          ),
        ),
      ),
    );
  }
}