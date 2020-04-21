import 'package:flutter/material.dart';
import 'package:pinjemin/screens/request_page.dart';
import 'package:pinjemin/screens/offer_page.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
        // backgroundColor: Colors.white,
        leading: IconButton(
            color: Theme.of(context).accentColor,
            icon: Icon(Icons.menu),
            onPressed: () {
              print("Clicked");
            }),
        actions: <Widget>[
          IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.notifications_none),
              onPressed: () {
                print("Notification Clicked");
              })
        ],
        elevation: 5,
      ),
    );
  }
}
