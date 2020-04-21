import 'package:flutter/material.dart';
import '../components/products_grid.dart';

class RequestScreen extends StatefulWidget {
  static String tag = 'request-screen';

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
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
      body: ProductsGrid(),
    );
  }
}
