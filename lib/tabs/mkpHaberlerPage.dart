import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MKPHaberler extends StatefulWidget {
  @override
  _MKPHaberlerState createState() => _MKPHaberlerState();
}

class _MKPHaberlerState extends State<MKPHaberler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 400,
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
                            Container(

                              child: ListTile(

                                leading: Image.network(
                                    "https://cdn.pixabay.com/photo/2015/11/07/12/02/business-man-1031755_960_720.jpg"),
                                title: Text('MKP Haber Portal', style: TextStyle(color: Colors.white)),
                                dense: true,

                              ),
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
      ),
    );
  }
}
