import 'package:flutter/material.dart';

class DialogBox {

  information(BuildContext context, String title, String description){
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(description)
                ],
              ),
            ),
            actions: [
              FlatButton(
                child: Text("Tamam"),
                onPressed: (){
                  return Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
  }
}