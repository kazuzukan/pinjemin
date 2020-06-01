import 'package:flutter/material.dart';
import 'package:pinjemin/screens/main_screen.dart';
import 'package:pinjemin/screens/productdetailreq.dart';
import 'app_theme.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/users.dart';
import './providers/user.dart';

import './screens/loginPage.dart';
import './screens/request_screen.dart';
import './screens/request_page.dart';
import './screens/form_req.dart';
import './screens/offer_screen.dart';
import './screens/form_offer.dart';
import './screens/transaction_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/akun_screen.dart';
// import './screens/profilsetting.dart';
import './screens/user_product_screen.dart';
import './screens/productdetailoffer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xFFFF7700));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Users()),
        ChangeNotifierProvider.value(value: User())
      ],
      child: MaterialApp(
        title: 'Pinjemin',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: LoginScreen(),
        routes: {
          '/login': (BuildContext context) => new LoginScreen(),
          LoginScreen.tag: (context) => LoginScreen(),
          MainScreen.tag: (context) => MainScreen(),
          RequestScreen.tag: (context) => RequestScreen(),
          RequestPage.tag: (context) => RequestPage(),
          OfferScreen.tag: (context) => OfferScreen(),
          FormReq.tag: (context) => FormReq(),
          FormOffer.tag: (context) => FormOffer(),
          TransactionScreen.tag: (context) => TransactionScreen(),
          ProductDetailScreen.tag: (context) => ProductDetailScreen(),
          AkunScreen.tag: (context) => AkunScreen(),
          // SettingAkun.tag: (context) => SettingAkun(email),
          UserProductsScreen.tag: (context) => UserProductsScreen(),
          ProductDetailOffer.tag: (context) => ProductDetailOffer(),
          ProductDetailReq.tag: (context) => ProductDetailReq()
        },
      ),
    );
  }
}