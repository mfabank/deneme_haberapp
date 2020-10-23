import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersCollection = Firestore.instance.collection("users");

  Future updateUserData(String username,String password) async {
    return await usersCollection.document(uid).setData({
      "username" : username,
      "password" : password,

    });
  }


}

