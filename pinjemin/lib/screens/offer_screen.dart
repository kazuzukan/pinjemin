import 'package:flutter/material.dart';
// import 'package:pinjemin/screens/form_offer.dart';


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
            decoration: InputDecoration(hintText: 'Cari Barang. . .'),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.settings_applications),
                onPressed: () {
                  print("settings");
                }),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
            heroTag: null,
            onPressed: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => FormOffer()));
            },
            child: Icon(Icons.add)),
        // body: 
    );
 
  }
}
