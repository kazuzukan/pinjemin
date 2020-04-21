import 'package:flutter/material.dart';
import './screens/login_page.dart';
import './screens/home_page.dart';
import './screens/register.dart';
import './screens/request_page.dart';
import './screens/form_req.dart';
import './screens/offer_page.dart';
import './screens/form_offer.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    Register.tag: (context) => Register(),
    RequestPage.tag: (context) => RequestPage(),
    OfferPage.tag: (context) => OfferPage(),
    FormReq.tag: (context) => FormReq(),
    FormOffer.tag: (context) => FormOffer(),

  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinjemin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}
