import 'package:flutter/material.dart';
import 'package:pinjemin/screens/form_offer.dart';


class OfferScreen extends StatefulWidget {
  static String tag = 'offer-screen';

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: null,
                autofocus: false,
                style:
                    new TextStyle(fontSize: 14.0, color: Colors.black, height: 1.5),
                decoration: new InputDecoration(
                  filled: true,
                  
                  fillColor: Colors.white,
                  hintText: 'Cari barang . . .',
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.blue),
                    borderRadius: new BorderRadius.circular(10),
                    
                  ),
                ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {
                  print("settings");
                }),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.push(
                   context, MaterialPageRoute(builder: (context) => FormOffer()));
            },
            child: Icon(Icons.add)),
        // body: 
    );
 
  }
}
