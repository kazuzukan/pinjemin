import 'package:flutter/material.dart';
import 'package:pinjemin/screens/request_screen.dart';

class FormOffer extends StatefulWidget {
  static String tag = 'form-offer-page';

  @override
  _FormOfferState createState() => _FormOfferState();
}

class _FormOfferState extends State<FormOffer> {
  @override
  Widget build(BuildContext context) {

       return Scaffold(
      
      //Appbar
      resizeToAvoidBottomPadding: false,
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

      //Body Form
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

            //Form Column
            new Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Nama Lengkap',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Domisili',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Mau Minjemin apa?',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                    child: TextFormField(                      
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Input NIK kamu',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                    child: TextFormField(                      
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Deskripsi Barang',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                    child: TextFormField(                      
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Jenis barang (inituh sesuai kategori)',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(RequestScreen.tag);
                      },
                      padding: EdgeInsets.all(12),
                      color: Colors.lightBlueAccent,
                      child: Text('PINJEMIN BARANG !', style: TextStyle(color: Colors.white)),
                    ),
                  )
                  
              ],
            ),
        ),
      ),

    );

  }
}