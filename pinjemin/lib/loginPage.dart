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

              // CarouselSlider(
              //     height: 380.0,
              //     initialPage: 0,
              //     aspectRatio: 16/9,
              //     // enlargeCenterPage: true,
              //     autoPlay: false,
              //     reverse: false,
              //     enableInfiniteScroll: true,
              //     autoPlayInterval: Duration(seconds: 2),
              //     autoPlayAnimationDuration: Duration(milliseconds: 2000),
              //     pauseAutoPlayOnTouch: Duration(seconds: 10),
              //     scrollDirection: Axis.horizontal,
              //     onPageChanged: (index) {
              //       setState(() {
              //         _current = index;
              //       });
              //     },
              //     items: imgList.map((img) {
              //       return Builder(
              //         builder: (BuildContext context) {
              //           return Container(
              //             width: MediaQuery.of(context).size.width,
              //             margin: EdgeInsets.symmetric(horizontal: 40.0),
              //             // decoration: BoxDecoration(
              //             //   color: Colors.green,
              //             // ),
              //             // child: Image.asset('assets/pinjemin.png')
              //             child: Image.asset(
              //               img,
              //               // scale: 7.0,
              //               fit: BoxFit.fitWidth
              //             ),
              //           );
              //         },
              //       );
              //     }).toList()
              // options: CarouselOptions(),
              // items: imgList.map((item) => Container(
              //   child: Center(
              //     child: Image.network(item, fit: BoxFit.cover, width: 1000)
              //   ),
              // )).toList(),
              )
        ],
      ),
    );

    Widget register = Container(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Belum Punya Akun ? '),
            InkWell(
              child: Text(
                'Register',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              onTap: (){print('Register Clicked');}
            )
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
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )
                    ],
                  ))),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: register,
              )
            ]),
      ),
    ));
  }
}
