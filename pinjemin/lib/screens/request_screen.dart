import 'package:flutter/material.dart';
import '../components/products_grid.dart';
import '../screens/form_req.dart';

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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FormReq()));
            },
            child: Icon(Icons.add)),
        body: ProductsGrid());
  }
}
