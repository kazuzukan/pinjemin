import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';

import './screens/loginPage.dart';
import './screens/request_screen.dart';
import './screens/register.dart';
import './screens/request_page.dart';
import './screens/form_req.dart';
import './screens/offer_page.dart';
import './screens/form_offer.dart';
import './screens/product_detail_screen.dart';
import './screens/akun_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xFFFF7700));
    return ChangeNotifierProvider.value(
      value: Products(),
      child: MaterialApp(
        title: 'Pinjemin',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: LoginScreen(),
        routes: {
          LoginScreen.tag: (context) => LoginScreen(),
          RequestScreen.tag: (context) => RequestScreen(),
          Register.tag: (context) => Register(),
          RequestPage.tag: (context) => RequestPage(),
          OfferPage.tag: (context) => OfferPage(),
          FormReq.tag: (context) => FormReq(),
          FormOffer.tag: (context) => FormOffer(),
          ProductDetailScreen.tag: (context) => ProductDetailScreen(),
          AkunScreen.tag: (context) => AkunScreen()
        },
      ),
    );
  }
}
