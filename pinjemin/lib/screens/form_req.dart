import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'sign_in.dart';

class FormReq extends StatefulWidget {
  static String tag = 'form-req-page';

  @override
  _FormReqState createState() => _FormReqState();
}

class _FormReqState extends State<FormReq> {
  String nama_brg = '';
  String deskripsi = '';
  String tipe_brg = '';

  DateTime tglAmbil = new DateTime.now();
  String tglAmbilText = '';

  DateTime tglKembali = new DateTime.now();
  String tglKembaliText = '';

  Future<Null> selectTglAmbil(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: tglAmbil,
        firstDate: DateTime(2019),
        lastDate: DateTime(2050));

    if (picked != null) {
      setState(() {
        tglAmbil = picked;
        tglAmbilText = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Future<Null> selectTglKembali(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: tglKembali,
        firstDate: DateTime(2019),
        lastDate: DateTime(2050));

    if (picked != null) {
      setState(() {
        tglKembali = picked;
        tglKembaliText = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _addDataReq(){
    Firestore.instance.runTransaction((Transaction transaction) async{
      CollectionReference reference = Firestore.instance.collection('req');
      await reference.add({
        "email" : email,
        "nama_brg" : nama_brg,
        "Deskripsi" : deskripsi,
        "tipe_brg" : tipe_brg,
        "tgl_awal" : tglAmbilText,
        "tgl_akhir" : tglKembaliText
      });
    }); 

    Navigator.pop(context);
  }


  @override
  void initState() {
    // implement initState
    super.initState();
    tglAmbilText = "${tglAmbil.day}/${tglAmbil.month}/${tglAmbil.year}";
    tglKembaliText = "${tglKembali.day}/${tglKembali.month}/${tglKembali.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            }),
        actions: <Widget>[
          IconButton(
              color: Colors.blue[300],
              icon: Icon(Icons.notifications_none),
              onPressed: () {
                print("Notification Clicked");
              })
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
          child: new Column(
            children: <Widget>[
              /* Padding(
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
                        hintText: 'Input NIK kamu',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      ),
                  ),
                  */
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextFormField(
                  onChanged: (String str) {
                    setState(() {
                      nama_brg = str;
                    });
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Mau Pinjem apa?',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextFormField(
                  onChanged: (String str) {
                    setState(() {
                      deskripsi = str;
                    });
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Deskripsi Barang',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextFormField(
                  onChanged: (String str) {
                    setState(() {
                      tipe_brg = str;
                    });
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Jenis barang (inituh sesuai kategori)',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Tanggal Ambil:",
                      style: new TextStyle(fontSize: 16, color: Colors.black),
                    )),
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        color: Colors.white,
                        onPressed: () => selectTglAmbil(context),
                        child: Text(
                          tglAmbilText,
                          style: new TextStyle(
                              fontSize: 16, color: Colors.black38),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Tanggal Kembali:",
                      style: new TextStyle(fontSize: 16, color: Colors.black),
                    )),
                    RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        color: Colors.lightBlueAccent,
                        onPressed: () => selectTglKembali(context),
                        child: Text(
                          tglKembaliText,
                          style:
                              new TextStyle(fontSize: 16, color: Colors.white),
                        )),
                  ],
                ),
              ),

              /*
                  Padding(
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                    child: TextFormField(                      
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Tanggal Pinjam',
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
                        hintText: 'Tanggal Pengembalian',
                        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      ),
                  ),

                  */
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  onPressed: () {
                    _addDataReq();
                  },
                  padding: EdgeInsets.all(12),
                  color: Colors.lightBlueAccent,
                  child: Text('PINJEM BARANG !',
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),

/*
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
 */
    );
  }
}
