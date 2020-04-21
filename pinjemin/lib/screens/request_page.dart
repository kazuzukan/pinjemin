import 'package:flutter/material.dart';
import 'package:pinjemin/screens/form_req.dart';
import 'package:pinjemin/screens/request_screen.dart';

class RequestPage extends StatefulWidget {
  static String tag = 'request-page';

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Image.asset('assets/pinjemin.png'),
              )
          ],
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.blue[300],
          icon: Icon(Icons.menu),
          onPressed: () {
              print("Clicked");
          }
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.blue[300],
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              print("Notification Clicked");
            }
          )
        ],
        elevation: 5,
      ),
      body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
          child: 
          new Column(
            children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: <Widget>[
                    Container(
                      color:Colors.white,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset('assets/qr-code.png', width: 30.0),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0,8.0,12.0,8.0,),
                                child: new Image.asset(
                                  'assets/coin.png',width: 30.0,  
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0,8.0,20.0,8.0,),
                                child: Text(
                                  'Rp. 33.000,00',
                                  style:
                                  new TextStyle(fontSize: 13.0, color: Colors.black87),
                                ),
                              ),
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
                            ]
                          ),
                        ]
                      )
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Cari barang. . .',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new InkWell(
                          onTap:  (){
                            Navigator.of(context).pushNamed(RequestScreen.tag);
                          } ,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0,8.0,8.0),           
                          child: new Image.asset( 'assets/backbutton.png',width: 60.0),          
                          )
                        ), 
                        new InkWell(
                          onTap:  (){
                            Navigator.of(context).pushNamed(FormReq.tag);
                          },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0,8.0,8.0),           
                          child: new Image.asset( 'assets/plusbutton.png',width: 60.0),          
                          )
                        ), 
                      ],
                    )
              ]
            ),
          ]
        ),
      )
    )

    )
    ;
  /*
    final search = TextFormField(
      decoration: InputDecoration(
        hintText: 'Search. . .',
        
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
        
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        fillColor: Colors.white,
        filled: true,
      ),
    );
   

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
        SizedBox(height: 16.0),
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
 */
  }
}
