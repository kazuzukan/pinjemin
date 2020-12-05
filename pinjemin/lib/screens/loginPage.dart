import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/largeButton.dart';
import '../components/carousel.dart';
import 'package:provider/provider.dart';
import '../providers/user.dart';
import '../providers/users.dart';

class LoginScreen extends StatefulWidget {
  // static String google = '/assets/icons/icon-google.svg';
  static String tag = 'login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // static MediaQueryData _mediaQueryData;
  bool isRegister = false;
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _onRegister() async {
    setState(() {
      _isLoading = true;
    });

    var user = User(
        email: emailController.text,
        firstname: firstNameController.text,
        lastname: lastNameController.text,
        password: passwordController.text);

    try {
      await Provider.of<Users>(context, listen: false).addUser(user);
    } catch (error) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An error occurred!'),
          content: Text('Something went wrong.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget welcome = Container(
        padding: const EdgeInsets.fromLTRB(0, 40.0, 20, 0.0),
        child: Container(
            child: Text(
          'Selamat Datang, Mau Pinjem Apa Hari Ini ?',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          textAlign: TextAlign.justify,
        )));

    Widget syarat = Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Syarat dan Ketentuan  ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white),
              textAlign: TextAlign.left,
            ),
            SvgPicture.asset('lib/assets/icons/icon-terms.svg')
          ],
        ));

    Widget title = Container(
      child: Stack(
        children: <Widget>[
          Container(
            // height: MediaQuery.of(context).size.height * 0.288,
            width: MediaQuery.of(context).size.width,
            child: SvgPicture.asset('lib/assets/icons/icon-bg-title.svg'),
          ),
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: welcome,
                  ),
                  SizedBox(
                    child: syarat,
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    );

    Widget register = Container(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Belum Punya Akun ? ',
                style: TextStyle(fontSize: 14, color: Colors.black)),
            InkWell(
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
                onTap: () {
                  setState(() {
                    isRegister = true;
                  });
                  print('Register Clicked');
                })
          ],
        ),
      ),
    );

    Widget login = Container(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Sudah Punya Akun ? ',
                style: TextStyle(fontSize: 12, color: Colors.black)),
            InkWell(
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
                onTap: () {
                  setState(() {
                    isRegister = false;
                  });
                  print('Register Clicked');
                })
          ],
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            // color: Colors.yellow,
            child: Column(children: <Widget>[
              Container(
                // height: 170,
                child: title,
              ),
              Container(
                child: AnimatedCrossFade(
                    firstChild: Column(
                      children: <Widget>[
                        Container(
                          // height: 30,
                          child: Center(
                            child: CarouselComponent(),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                          margin: EdgeInsets.all(8),
                          child: TextFormField(
                            obscureText: false,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Email",
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(16.0)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                          margin: EdgeInsets.all(8),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "password",
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(16.0)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0))),
                          ),
                        ),
                        Container(
                          child: FlatButton(
                              onPressed: () {}, child: Text("LOGIN")),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Center(
                              child: LargeButton(
                                widgetsList: <Widget>[
                                  SizedBox(
                                    width: 40,
                                    child: SvgPicture.asset(
                                      'lib/assets/icons/icon-google.svg',
                                    ),
                                  ),
                                  Text(
                                    'Masuk Dengan Google',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  )
                                ],
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: register,
                        ),
                        Container(
                          padding: EdgeInsets.all(24),
                          margin: EdgeInsets.all(24),
                        )
                      ],
                    ),
                    secondChild: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(24, 0, 24, 0),
                                      margin: EdgeInsets.all(8),
                                      child: TextFormField(
                                        controller: firstNameController,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                20.0, 15.0, 20.0, 15.0),
                                            hintText: "First Name",
                                            filled: true,
                                            fillColor: Color.fromRGBO(
                                                243, 241, 239, 0.4),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.orange),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0))),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(24, 0, 24, 0),
                                      margin: EdgeInsets.all(8),
                                      child: TextFormField(
                                        controller: lastNameController,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                20.0, 15.0, 20.0, 15.0),
                                            hintText: "Last Name",
                                            filled: true,
                                            fillColor: Color.fromRGBO(
                                                243, 241, 239, 0.4),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.orange),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0))),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(24, 0, 24, 0),
                                      margin: EdgeInsets.all(8),
                                      child: TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                20.0, 15.0, 20.0, 15.0),
                                            hintText: "Email",
                                            filled: true,
                                            fillColor: Color.fromRGBO(
                                                243, 241, 239, 0.4),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.orange),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0))),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(24, 0, 24, 0),
                                      margin: EdgeInsets.all(8),
                                      child: TextFormField(
                                        controller: passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                20.0, 15.0, 20.0, 15.0),
                                            hintText: "password",
                                            filled: true,
                                            fillColor: Color.fromRGBO(
                                                243, 241, 239, 0.4),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.orange),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.0))),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      margin: EdgeInsets.all(8),
                                      child: FlatButton(
                                        onPressed: _onRegister,
                                        color: Colors.orange,
                                        textColor: Colors.white,
                                        padding:
                                            EdgeInsets.fromLTRB(64, 12, 64, 12),
                                        splashColor: Colors.orangeAccent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Text("Register"),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                    // secondChild: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Container(
                    //       margin: const EdgeInsets.only(top: 10),
                    //       child: LargeButton(
                    //         widgetsList: <Widget>[
                    //           SizedBox(
                    //             width: 40,
                    //             child: SvgPicture.asset(
                    //               'lib/assets/icons/icon-google.svg',
                    //             ),
                    //           ),
                    //           Text(
                    //             'Daftar Dengan Google',
                    //             style: TextStyle(
                    //                 color: Colors.black, fontSize: 14),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     Container(
                    //       margin: const EdgeInsets.only(top: 10),
                    //       // child: Center(
                    //       child: LargeButton(
                    //         widgetsList: <Widget>[
                    //           SizedBox(
                    //             width: 40,
                    //             child: SvgPicture.asset(
                    //               'lib/assets/icons/icon-email.svg',
                    //             ),
                    //           ),
                    //           Text(
                    //             'Daftar Dengan Email',
                    //             style: TextStyle(
                    //                 color: Colors.black, fontSize: 14),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     Container(
                    //       margin: const EdgeInsets.only(top: 40),
                    //       child: login,
                    //     )
                    //   ],
                    // ),
                    crossFadeState: isRegister
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: Duration(milliseconds: 500)),
              )
            ]),
          ),
        ));
  }
}
