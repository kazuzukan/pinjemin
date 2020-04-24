import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.white,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Color.fromARGB(255, 255, 119, 0),
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: new TextStyle(
                  color: Colors
                      .grey))
                      ), // sets the inactive color of the `BottomNavigationBar`
      child: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up),
            title: Text('Permintaan'),
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
    );
  }
}
