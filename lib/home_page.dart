import 'package:flutter/material.dart';
import 'package:pinjemin/login_page.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final profil = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.only(left: 0.0),
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

    final search = TextFormField(
      decoration: InputDecoration(
        hintText: 'Search. . .',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        fillColor: Colors.white,
        filled: true,
      ),
    );

    /*final scan = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.only(left:0.0),
        child: CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/qr-code.png'),
        ),
      ),
    );
*/

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
      child: Column(children: <Widget>[
        new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[profil, welcome]),
        SizedBox(height: 16.0),
        search,
        SizedBox(height: 16.0),
        
        Container(
          color: Colors.white,
          child: new Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Image.asset('assets/qr-code.png', width: 30.0),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Image.asset(
                        'assets/coin.png',
                        width: 30.0,
                      ),
                    ),
                    Text(
                      'Rp. 33.000,00',
                      style: new TextStyle(fontSize: 13.0, color: Colors.black87),
                    )
                  ]),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '18.000 Poin',
                    style: new TextStyle(fontSize: 13.0, color: Colors.black87),
                  ),
                  Text(
                    'Klik & kumpulkan poin',
                    style: new TextStyle(fontSize: 10.0, color: Colors.black54),
                  ),
                ],
              )
            ],
          ),
        ),
        paragraf2,
        paragraf3
      ]),
    );

    return Scaffold(body: body);
  }
}
