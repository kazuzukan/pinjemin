import 'package:flutter/material.dart';
//import 'package:pinjemin/components/bottomnav.dart';
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
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;

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
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Color.fromARGB(255, 255, 119, 0),
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: new TextStyle(
                      color: Colors
                          .grey))), // sets the inactive color of the `BottomNavigationBar`
          child: new BottomNavigationBar(
            onTap: onTabTapped, // new
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.thumb_up),
                title: Text('Permintaan'),
                backgroundColor: Colors.blue,
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.thumb_down),
                title: Text('Penawaran'),
              ),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.receipt), title: Text('Transaksi')),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Akun'))
            ],
          ),
        ));
  }
}
