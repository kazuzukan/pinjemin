import 'package:flutter/material.dart';
import 'package:pinjemin/providers/product.dart';
import 'package:pinjemin/screens/main_screen.dart';
import 'app_theme.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/users.dart';

import './screens/loginPage.dart';
import './screens/request_screen.dart';
import './screens/register.dart';
import './screens/request_page.dart';
import './screens/form_req.dart';
import './screens/offer_screen.dart';
import './screens/form_offer.dart';
import './screens/transaction_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/akun_screen.dart';
import './screens/profilsetting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xFFFF7700));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Users())
      ],
      child: MaterialApp(
        title: 'Pinjemin',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: LoginScreen(),
        routes: {
          LoginScreen.tag: (context) => LoginScreen(),
          MainScreen.tag: (context) => MainScreen(),
          RequestScreen.tag: (context) => RequestScreen(),
          Register.tag: (context) => Register(),
          RequestPage.tag: (context) => RequestPage(),
          OfferScreen.tag: (context) => OfferScreen(),
          FormReq.tag: (context) => FormReq(),
          FormOffer.tag: (context) => FormOffer(),
          TransactionScreen.tag: (context) => TransactionScreen(),
          ProductDetailScreen.tag: (context) => ProductDetailScreen(),
          AkunScreen.tag: (context) => AkunScreen(),
          SettingAkun.tag: (context) => SettingAkun()
        },
      ),
    );
  }
}