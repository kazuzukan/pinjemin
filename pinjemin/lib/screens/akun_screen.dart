import 'package:flutter/material.dart';
import 'package:pinjemin/assets/fonts/custom1_icons.dart';
import '../screens/profilsetting.dart';
// import 'package:flutter_svg/flutter_svg.dart';


class AkunScreen extends StatefulWidget {
   static String tag = 'akun-screen';

  @override
  _AkunScreenState createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen>{
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Container( // setting profil
                constraints: BoxConstraints(minHeight: 200, maxHeight: 280),
                color : Color.fromARGB(255, 255, 119, 0),
                child: Column(
                  children: <Widget>[
                    Padding(
                  padding: EdgeInsets.fromLTRB(310,30,0,0),
                  child: MaterialButton( 
                    onPressed: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => SettingAkun()));
                    },
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      )
                      
                    ),
                  ),
                    Padding(
                  padding: EdgeInsets.fromLTRB(50,0,50,10),
                  child: FittedBox(
                    fit: BoxFit.contain, // otherwise the logo will be tiny
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(100,0,100,0),
                      child: CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/profil.jpg'),
                      ),
                    ),
                  ),
                ),
                    Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    'Muhammad Luthfiansyah',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )
                  ),
                ),
                    Padding(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    'Mahasiswa, 21',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    )
                  ),
                ) 
                  ],
                ),
              ),
              Container( // poin topup
                constraints: BoxConstraints(minHeight: 50, maxHeight: 120, minWidth: 500, maxWidth: 500),
                color : Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 300, 0),
                      child: Text(
                        'Poinku',
                        style: TextStyle(color: Colors.black54,fontSize: 12, fontWeight: FontWeight.bold,)                       
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Container(
                        constraints: BoxConstraints(minHeight: 10, maxHeight: 60, minWidth: 300, maxWidth: 350),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)
                          ) 
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:<Widget>[
                            Padding(padding: EdgeInsets.all(10),
                              child: Row(children: <Widget>[
                                Padding(padding: EdgeInsets.all(0),
                                child: IconButton(
                            icon: Icon(Custom1.iconpoint, size: 30,color: Colors.red,
                            ),
                            onPressed: () {
                            print("Notification Clicked");
                            }),
                            ),
                            Padding(padding: EdgeInsets.all(0),
                              child: Column(
                                children: <Widget>[
                                Text('Jumlah Poin', style: TextStyle(color: Colors.black54,fontSize: 12)
                                ),
                                Text('3000', style: TextStyle(fontSize: 12),),
                              ],
                            )
                             ) ],
                            ),
                            ),
                            Padding(padding: EdgeInsets.all(10),
                            child: Row(
                              
                            )
                            ),
                            Padding(padding: EdgeInsets.all(10),
                              child: Row(children: <Widget>[
                                Padding(padding: EdgeInsets.all(0),
                                child: IconButton(
                            icon: Icon(Custom1.icontopup, size: 30,color: Colors.lightGreen,
                            ),
                            onPressed: () {
                            print("Notification Clicked");
                            }),
                            ),
                            Text(
                            'Top Up Poin', style: TextStyle(color: Colors.black54,fontSize: 12)
                             ) ],
                            ),
                            ),
                            Padding(padding: EdgeInsets.all(10),
                            child: Row(
                              
                            )
                            )
                          ]
                        ),
                      ),
                      )         
                  ], 
                ),
              ),
              Container( // blank
                constraints: BoxConstraints(minHeight: 10, maxHeight: 10, minWidth: 500, maxWidth: 500),
                decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          shape: BoxShape.rectangle,
                          ),
               
              ),
              Container( // faq
                constraints: BoxConstraints(minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
                decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border(
                            top: BorderSide(width: 1.0, color: Colors.black12),
                          )
                        ),
                 child: Row(
                  children:<Widget>[
                    Padding(
                      padding: EdgeInsets.all(10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      
                      children:<Widget>[
                        Text('FAQ                                                                          '),
                        IconButton(
                        icon: Icon(Icons.keyboard_arrow_right, size: 20,color: Colors.black,),
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => SettingAkun()));
                        }
                      ),
                        
                      ]
                    ),
                    )
                  ]
                ),
              ),
              Container( // tentang app
                constraints: BoxConstraints(minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
                decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border(
                            top: BorderSide(width: 1.0, color: Colors.black12),
                          )
                        ),
                        child: Row(
                  children:<Widget>[
                    Padding(
                      padding: EdgeInsets.all(10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget>[
                        Text('Tentang Aplikasi                                                 '),
                        IconButton(
                        icon: Icon(Icons.keyboard_arrow_right, size: 20,color: Colors.black,),
                        onPressed: () {
                      print("Notification Clicked");
                    }),
                        
                      ]
                    ),
                    )
                  ]
                ),
              ),
              Container( // logout
                constraints: BoxConstraints(minHeight: 60, maxHeight: 60, minWidth: 500, maxWidth: 500),
                decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border(
                            top: BorderSide(width: 1.0, color: Colors.black12),
                            bottom: BorderSide(width: 1.0, color: Colors.black12)
                          )
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top:15),
                          child: Text(
                            'Logout',
                          style: TextStyle(color: Color.fromARGB(255, 255, 119, 0),
                          ),
                          textAlign: TextAlign.center,
                          ),
                ),
              )
            ],
          ),
      ),
    );
  }
}
