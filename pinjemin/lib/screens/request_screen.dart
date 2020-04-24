import 'package:flutter/material.dart';
import 'package:pinjemin/components/bottomnav.dart';
import '../components/products_grid.dart';
import '../screens/form_req.dart';

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
                icon: Icon(Icons.notifications_none),
                onPressed: () {
                  print("Notification Clicked");
                }),
          ],
        ),
        body: ProductsGrid(),
        // bottomNavigationBar: BottomNavBar(), //kalo pake ini layout card nya ketutupan bottomnav, gatau why
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(FormReq.tag);
            },
            child: Icon(Icons.add)),
        bottomNavigationBar: BottomNavBar()
        );
  }
}
