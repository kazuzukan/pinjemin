import 'package:flutter/material.dart';
// import 'package:pinjemin/assets/fonts/custom1_icons.dart';
// import '../screens/akun_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class SettingAkun extends StatefulWidget {
  static var tag;

  @override
  _SettingAkunState createState() => _SettingAkunState();
}

class _SettingAkunState extends State<SettingAkun> {
  final _formKey = GlobalKey<FormState>();
  GoogleSignInAccount _currentUser;

  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Setting Akun",
        style: new TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
      )),
      body: Container(
        color: Colors.white,
        child: Column(children: <Widget>[
          Container(
            constraints: BoxConstraints(
                minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border(
                //top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nama Lengkap',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        _currentUser.displayName ?? '',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      IconButton(
                          icon: Icon(Icons.keyboard_arrow_right,
                              size: 20, color: Colors.grey),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Stack(
                                      overflow: Overflow.visible,
                                      children: <Widget>[
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  //initialValue: "Muhammad Luthfiansyah",
                                                  autofocus: false,
                                                  initialValue: '',
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8.0)),
                                                    ),
                                                    labelText: 'Nama Lengkap',
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 10, 0),
                                                        child: RaisedButton(
                                                          textColor:
                                                              Colors.grey,
                                                          color: Colors.white,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: new Text(
                                                            "Batal",
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        )),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 0, 10, 0),
                                                      child: RaisedButton(
                                                        textColor: Colors.white,
                                                        color: Color.fromARGB(
                                                            255, 255, 119, 0),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: new Text(
                                                          "Simpan",
                                                        ),
                                                        onPressed: () {
                                                          if (_formKey
                                                              .currentState
                                                              .validate()) {
                                                            _formKey
                                                                .currentState
                                                                .save();
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }),
                    ],
                  ),
                ]),
          ),
          Container(
            constraints: BoxConstraints(
                minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border(
                //top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Alamat ',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Gang Mawar 2 lanta... ',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            size: 20,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Stack(
                                      overflow: Overflow.visible,
                                      children: <Widget>[
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  autofocus: false,
                                                  initialValue: '',
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8.0)),
                                                    ),
                                                    labelText: 'Alamat Baru',
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 10, 0),
                                                        child: RaisedButton(
                                                          textColor:
                                                              Colors.grey,
                                                          color: Colors.white,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: new Text(
                                                            "Batal",
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        )),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 0, 10, 0),
                                                      child: RaisedButton(
                                                        textColor: Colors.white,
                                                        color: Color.fromARGB(
                                                            255, 255, 119, 0),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: new Text(
                                                          "Simpan",
                                                        ),
                                                        onPressed: () {
                                                          if (_formKey
                                                              .currentState
                                                              .validate()) {
                                                            _formKey
                                                                .currentState
                                                                .save();
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }),
                    ],
                  ),
                ]),
          ),
          Container(
            constraints: BoxConstraints(
                minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border(
                //top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Email',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        _currentUser.email ?? '',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            size: 20,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Stack(
                                      overflow: Overflow.visible,
                                      children: <Widget>[
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  autofocus: false,
                                                  initialValue: '',
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8.0)),
                                                    ),
                                                    labelText: 'Email Baru',
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 10, 0),
                                                        child: RaisedButton(
                                                          textColor:
                                                              Colors.grey,
                                                          color: Colors.white,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: new Text(
                                                            "Batal",
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        )),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 0, 10, 0),
                                                      child: RaisedButton(
                                                        textColor: Colors.white,
                                                        color: Color.fromARGB(
                                                            255, 255, 119, 0),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: new Text(
                                                          "Simpan",
                                                        ),
                                                        onPressed: () {
                                                          if (_formKey
                                                              .currentState
                                                              .validate()) {
                                                            _formKey
                                                                .currentState
                                                                .save();
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }),
                    ],
                  ),
                ]),
          ),
          Container(
            constraints: BoxConstraints(
                minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border(
                //top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              ),
            ),
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Tanggal Lahir                                               ',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '15 / 11 / 1998',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            size: 20,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // ini harusnya kalender
                          }),
                    ]),
              )
            ]),
          ),
          Container(
            constraints: BoxConstraints(
                minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border(
                //top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              ),
            ),
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Jenis Kelamin                                                  ',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Laki - laki',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            size: 20,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            //radio
                          }),
                    ]),
              )
            ]),
          ),
          Container(
            constraints: BoxConstraints(
                minHeight: 50, maxHeight: 60, minWidth: 500, maxWidth: 500),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              border: Border(
                //top: BorderSide(width: 1.0, color: Colors.black12),
                bottom: BorderSide(width: 1.0, color: Colors.black12),
              ),
            ),
            child: Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Ubah Kata Sandi                                                          ',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '  ',
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            size: 20,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Stack(
                                      overflow: Overflow.visible,
                                      children: <Widget>[
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  obscureText: _isHidePassword,
                                                  autofocus: false,
                                                  initialValue: '',
                                                  keyboardType:
                                                      TextInputType.text,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8.0)),
                                                    ),
                                                    labelText: 'Password Baru',
                                                    suffixIcon: GestureDetector(
                                                      onTap: () {
                                                        _togglePasswordVisibility();
                                                      },
                                                      child: Icon(
                                                        _isHidePassword
                                                            ? Icons
                                                                .visibility_off
                                                            : Icons.visibility,
                                                        color: _isHidePassword
                                                            ? Colors.grey
                                                            : Colors.blue,
                                                      ),
                                                    ),
                                                    isDense: true,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 10, 0),
                                                        child: RaisedButton(
                                                          textColor:
                                                              Colors.grey,
                                                          color: Colors.white,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: new Text(
                                                            "Batal",
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        )),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 0, 10, 0),
                                                      child: RaisedButton(
                                                        textColor: Colors.white,
                                                        color: Color.fromARGB(
                                                            255, 255, 119, 0),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: new Text(
                                                          "Simpan",
                                                        ),
                                                        onPressed: () {
                                                          if (_formKey
                                                              .currentState
                                                              .validate()) {
                                                            _formKey
                                                                .currentState
                                                                .save();
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }),
                    ]),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
