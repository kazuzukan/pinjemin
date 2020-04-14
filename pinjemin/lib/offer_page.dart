import 'package:flutter/material.dart';
import 'package:pinjemin/home_page.dart';
import 'package:pinjemin/form_offer.dart';


class OfferPage extends StatefulWidget {
  static String tag = 'offer-page';

  @override
  _OfferPageState createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
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
                            Navigator.of(context).pushNamed(HomePage.tag);
                          } ,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0,8.0,8.0),           
                          child: new Image.asset( 'assets/backbutton.png',width: 60.0),          
                          )
                        ), 
                        new InkWell(
                          onTap:  (){
                            Navigator.of(context).pushNamed(FormOffer.tag);
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

    );
 
  }
}