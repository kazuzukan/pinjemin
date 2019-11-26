import 'package:flutter/material.dart';
import 'package:pinjemin/login_page.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final profil = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.only(left:0.0),
        child: CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/butterfly.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.fromLTRB(10.0, 8.0, 2.0, 2.0),
      child: Text(
        'PINJEM.IN',
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );

    final paragraf1 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Halo, ini adalah aplikasi Pinjemin!!',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final paragraf2 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Saat ini, aku ganteng',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final paragraf3 = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'uwu',
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        
          children: <Widget>
          [new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[profil, welcome]),
          paragraf1, paragraf2, paragraf3]),
    );

    return Scaffold(
      body: body,
    );
  }
}
