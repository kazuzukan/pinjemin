import 'package:flutter/material.dart';
import 'package:pinjemin/home_page.dart';

class RequestPage extends StatefulWidget {
  static String tag = 'request-page';

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {
  
    final search = TextFormField(
      decoration: InputDecoration(
        hintText: 'Search. . .',
        
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
        
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        fillColor: Colors.white,
        filled: true,
      ),
    );
   
   final listbox = ;

    final copyright = Padding( //footer
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
         new Row(mainAxisAlignment: MainAxisAlignment.center, 
         children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Image.asset(
              'assets/pinjemin.png',
              width: 150.0,
            ),
          ),
        ]),       
       
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
                      
                      padding: const EdgeInsets.fromLTRB(20.0,8.0,20.0,8.0),
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
         SizedBox(height: 16.0),search,
        SizedBox(height: 16.0), listbox,
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
      
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              
            ], //diisi konten
          ),
        ),
        new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
           copyright
            ],
        )
      ]),
    );
    return Scaffold(body: body);
 
  }
}
