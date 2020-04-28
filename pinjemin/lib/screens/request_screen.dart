import 'package:flutter/material.dart';
import 'package:pinjemin/components/bottomnav.dart';
import '../components/products_grid.dart';
import '../screens/form_req.dart';
import '../screens/akun_screen.dart';

class RequestScreen extends StatefulWidget {
  static String tag = 'request-screen';

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  void onTabTapped(int index) {
    setState(() {
      // _currentIndex = index;
    });
  }

  // int _currentIndex = 0;

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
        body: ProductsGrid(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AkunScreen.tag);
            },
            child: Icon(Icons.add)),
        bottomNavigationBar: BottomNavBar()
        );
  }
}
