import 'package:flutter/material.dart';
import 'package:pinjemin/assets/fonts/custom_icons.dart';
import 'package:pinjemin/assets/fonts/custom2_icons.dart';

class TransaksiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      constraints: BoxConstraints(minHeight: 230, maxHeight: 230, minWidth: 500, maxWidth: 500),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 0.5,
      ),
        borderRadius: new BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children:<Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 260, 0),
            child: Text(
              'Request',
              style: TextStyle(color: Colors.black87,fontSize: 14, fontWeight: FontWeight.w600,),                       
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Custom.iconrequest, size: 20,color: Color.fromARGB(255,223, 3, 93)),
                  onPressed: (){
                  print("Notification Clicked");
                  }
                ),
                Text(
                  'Dimas Satria',
                  style: TextStyle(color: Colors.black87,fontSize: 14,),
                )
              ]
            )           
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Custom.iconoffer, size: 20,color: Color.fromARGB(255,54, 57, 164)),
                  onPressed: (){
                  print("Notification Clicked");
                  }
                ),
                Text(
                  'Risyad P',
                  style: TextStyle(color: Colors.black87,fontSize: 14,),
                )
              ]
            )           
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Custom2.iconbox, size: 20,color: Color.fromARGB(255,254, 178, 1)),
                  onPressed: (){
                  print("Notification Clicked");
                  }
                ),
                Text(
                  'Payung Warna Hitam',
                  style: TextStyle(color: Colors.black87,fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,55,0),
                         child: Text(
                            "Peminjaman Berlangsung",
                            style: TextStyle(fontSize: 12),
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,10,0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color : Colors.red,
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "Selesai",
                            style: TextStyle(fontSize: 12),
                          ),
                          onPressed: () {}
                        ),
                      ),                            
                    ],
                  )
                )
              ]
            )           
          ), 
        ]
      )
    );
  }
}