import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/users.dart';
import '../providers/user.dart';
// import 'package:pinjemin/assets/fonts/custom1_icons.dart';
// import '../screens/akun_screen.dart';

class SettingAkun extends StatefulWidget {
  static var tag;
  final String email;
  SettingAkun(this.email);
  @override
  _SettingAkunState createState() => _SettingAkunState(email);
}

class _SettingAkunState extends State<SettingAkun> {
  final _formKey = GlobalKey<FormState>();

  bool _isHidePassword = true;
  String email;
  List<User> _userData = new List();

  _SettingAkunState(this.email);

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<Users>(context, listen: false).getUser(email);
    final user = Provider.of<Users>(context, listen: false).userDetail;
    final userExist = Provider.of<User>(context);
    setState(() {
      _userData = <User>[user[0]];
    });
    print(userExist.firstname);
    super.didChangeDependencies();
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
                        _userData[0].firstname,
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
                        'Gang Mawar 2 lantai...',
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
                        _userData[0].email,
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Tanggal Lahir',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Row(
                    children: <Widget>[
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
                      'Jenis Kelamin',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Row(
                    children: <Widget>[
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
                      'Ubah Kata Sandi',
                      style: TextStyle(fontSize: 14),
                    ),
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
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8.0)),
                                                ),
                                                labelText: 'Password Baru',
                                                suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    _togglePasswordVisibility();
                                                  },
                                                  child: Icon(
                                                    _isHidePassword
                                                        ? Icons.visibility_off
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: <Widget>[
                                                Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(10, 0, 10, 0),
                                                    child: RaisedButton(
                                                      textColor: Colors.grey,
                                                      color: Colors.white,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: new Text(
                                                        "Batal",
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    )),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 0, 10, 0),
                                                  child: RaisedButton(
                                                    textColor: Colors.white,
                                                    color: Color.fromARGB(
                                                        255, 255, 119, 0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: new Text(
                                                      "Simpan",
                                                    ),
                                                    onPressed: () {
                                                      if (_formKey.currentState
                                                          .validate()) {
                                                        _formKey.currentState
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
      ),
    );
  }
}
