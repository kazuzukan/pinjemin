import 'package:flutter/material.dart';
// import 'package:pinjemin/assets/fonts/custom1_icons.dart';
// import '../screens/akun_screen.dart';

class SettingAkun extends StatefulWidget {
  static var tag;

  @override
  _SettingAkunState createState() => _SettingAkunState();
}

class _SettingAkunState extends State<SettingAkun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Setting Akun",
        style: new TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
        )
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children:<Widget>[
            Container(
              constraints: BoxConstraints(minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border(
                //top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
                ),

              ),
              child: Row(
                children:<Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget>[
                        Text('Nama Lengkap                                   ', style: TextStyle(fontSize: 14),),
                        Text('Muhammad Lu...',
                        style: TextStyle(color: Colors.grey, fontSize: 12),),
                        IconButton(
                        icon: Icon(Icons.keyboard_arrow_right, size: 20,color: Colors.grey),
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
            Container(
              constraints: BoxConstraints(minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border(
                //top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
                ),

              ),
              child: Row(
                children:<Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget>[
                        Text('Alamat                                         ', style: TextStyle(fontSize: 14),),
                        Text('Gang Mawar 2 lanta... ',
                        style: TextStyle(color: Colors.grey, fontSize: 12),),
                        IconButton(
                        icon: Icon(Icons.keyboard_arrow_right, size: 20,color: Colors.grey,),
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
            Container(
              constraints: BoxConstraints(minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border(
                //top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
                ),

              ),
              child: Row(
                children:<Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget>[
                        Text('Email                                                 ', style: TextStyle(fontSize: 14),),
                        Text('azureflute@gmail... ',
                        style: TextStyle(color: Colors.grey, fontSize: 12),),
                        IconButton(
                        icon: Icon(Icons.keyboard_arrow_right, size: 20,color: Colors.grey,),
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
            Container(
              constraints: BoxConstraints(minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border(
                //top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
                ),

              ),
              child: Row(
                children:<Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget>[
                        Text('Tanggal Lahir                                               ', style: TextStyle(fontSize: 14),),
                        Text('15 / 11 / 1998',
                        style: TextStyle(color: Colors.grey, fontSize: 12),),
                        IconButton(
                        icon: Icon(Icons.keyboard_arrow_right, size: 20,color: Colors.grey,),
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
            Container(
              constraints: BoxConstraints(minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border(
                //top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
                ),

              ),
              child: Row(
                children:<Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget>[
                        Text('Jenis Kelamin                                                  ', style: TextStyle(fontSize: 14),),
                        Text('Laki - laki',
                        style: TextStyle(color: Colors.grey, fontSize: 12),),
                        IconButton(
                        icon: Icon(Icons.keyboard_arrow_right, size: 20,color: Colors.grey,),
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
            Container(
              constraints: BoxConstraints(minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: Border(
                //top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
                ),

              ),
              child: Row(
                children:<Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:<Widget>[
                        Text('Ubah Kata Sandi                                                          ', style: TextStyle(fontSize: 14),),
                        Text('  ',
                        style: TextStyle(color: Colors.grey, fontSize: 10),),
                        IconButton(
                        icon: Icon(Icons.keyboard_arrow_right, size: 20,color: Colors.grey,),
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => SettingAkun()));
                        }
                      ),
                      ]
                    ),
                    )
                  ]
                ),
            )
            
          ]
        ),
      ),
             


    );
  }
}