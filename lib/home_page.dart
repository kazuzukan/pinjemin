import 'package:flutter/material.dart';
import 'package:pinjemin/request_page.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    
    final copyright = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        '@Copyright 2019',
        style: TextStyle(fontSize: 10.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlue[100],
              Colors.indigo[100],
            ]),
      ),
      child: Column(children: <Widget>[
        new Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Image.asset(
              'assets/pinjemin.png',
              width: 150.0,
            ),
          ),
        ]),
     
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
                      style:
                          new TextStyle(fontSize: 13.0, color: Colors.black87),
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
        SizedBox(height: 10.0),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Image.asset(
                'assets/categories.png',
                width: 60.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0,8.0,8.0),
              child: new Image.asset(
                'assets/offer.png',
                width: 60.0,
              ),
            ),
            new InkWell(
              onTap:  (){
                 Navigator.of(context).pushNamed(RequestPage.tag);
              } ,

              child: new Padding(
              
              padding: const EdgeInsets.all(8.0),
              child: new Image.asset(
                'assets/request.png',
                width: 60.0,
              ),
            )),
          ],
        ),
        Expanded(
          child: Column(
            children: <Widget>[], //diisi konten
          ),
        ),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[copyright],
        )
      ]),
    );

    return Scaffold(body: body);
  }
}
