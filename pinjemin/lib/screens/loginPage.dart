import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:pinjemin/components/largeButton.dart';

class LoginScreen extends StatefulWidget {
  // static String google = '/assets/icons/icon-google.svg';
  static String tag = 'login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static MediaQueryData _mediaQueryData;
  bool isRegister = false;
  @override
  Widget build(BuildContext context) {
    Widget welcome = Container(
        padding: const EdgeInsets.only(top: 32, left: 13, right: 50),
        child: Container(
            child: Text(
          'Selamat Datang, Mau Pinjem Apa Hari Ini ?',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          textAlign: TextAlign.justify,
        )));

    Widget syarat = Container(
        padding: const EdgeInsets.only(right: 10, top: 35),
        child: Text(
          'Syarat dan Ketentuan',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),
          textAlign: TextAlign.right,
        ));

    Widget title = Container(
      child: Stack(
        children: <Widget>[
          Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SvgPicture.asset('lib/assets/icons/icon-bg-title.svg')),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 250,
                height: 120,
                child: welcome,
              ),
              SizedBox(
                width: 161,
                height: 120,
                child: syarat,
              ),
            ],
          )),
        ],
      ),
    );

    Widget carousel = Container(
      child: Column(
        children: <Widget>[
          SizedBox(
              height: 350.0,
              width: 400.0,
              child: Carousel(
                images: [
                  SvgPicture.asset('lib/assets/icons/welcome-screen-1.svg'),
                  // Image.asset('assets/welcome-screen-1.png'),
                  SvgPicture.asset('lib/assets/icons/welcome-screen-2.svg'),
                  SvgPicture.asset('lib/assets/icons/welcome-screen-3.svg')
                ],
                dotSize: 8.0,
                dotSpacing: 15.0,
                dotColor: Colors.grey,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.purple.withOpacity(0.0),
                borderRadius: true,
                moveIndicatorFromBottom: 180.0,
                noRadiusForIndicator: true,
              ))
        ],
      ),
    );

    Widget register = Container(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Belum Punya Akun ? ',
                style: TextStyle(fontSize: 12, color: Colors.black)),
            InkWell(
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 12,
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
        body: SafeArea(
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
                            child: carousel,
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
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
                                    'Daftar Dengan Google',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  )
                                ],
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: register,
                        )
                      ],
                    ),
                    secondChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 100),
                          child: LargeButton(
                            widgetsList: <Widget>[
                              SizedBox(
                                width: 40,
                                child: SvgPicture.asset(
                                  'lib/assets/icons/icon-google.svg',
                                ),
                              ),
                              Text(
                                'Daftar Dengan Google',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          // child: Center(
                          child: LargeButton(
                            widgetsList: <Widget>[
                              SizedBox(
                                width: 40,
                                child: SvgPicture.asset(
                                  'lib/assets/icons/icon-email.svg',
                                ),
                              ),
                              Text(
                                'Daftar Dengan Email',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: login,
                        )
                      ],
                    ),
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
