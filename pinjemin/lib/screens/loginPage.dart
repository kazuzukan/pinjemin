import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:pinjemin/components/largeButton.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatelessWidget {
  // static String google = '/assets/icons/icon-google.svg';
  static String tag = 'login-screen';
  final String googleAssets = 'assets/icon-google.svg';
  @override
  Widget build(BuildContext context) {
    Widget welcome = Container(
        padding: const EdgeInsets.only(left: 16, top: 32, right: 46),
        child: Column(
          children: <Widget>[
            Text(
              'Selamat Datang, Mau Pinjemin Apa Hari Ini ?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.justify,
            )
          ],
        ));

    Widget syarat = Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          children: <Widget>[
            Text(
              'Syarat dan Ketentuan',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              textAlign: TextAlign.right,
            )
          ],
        ));

    Widget title = Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[welcome],
          ),
        ),
        syarat
      ],
    ));

    Widget carousel = Container(
      child: Column(
        children: <Widget>[
          SizedBox(
              height: 420.0,
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
              )
            )
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
                  print('Register Clicked');
                })
            // Text(
            //   'Register',
            //   style: TextStyle(
            //     decoration: TextDecoration.underline
            //   )
            // )
          ],
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            // color: Colors.yellow,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 170,
                    child: title,
                  ),
                  Container(
                    // height: 30,
                    child: Center(
                      child: carousel,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Center(
                          child: LargeButton(),
                      )),

                    Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: register,
                  )
                ]),
          ),
        ));
  }
}
