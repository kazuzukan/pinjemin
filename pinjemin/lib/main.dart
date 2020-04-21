import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';

import './screens/login_page.dart';
import './screens/request_screen.dart';
import './screens/register.dart';
import './screens/request_page.dart';
import './screens/form_req.dart';
import './screens/offer_page.dart';
import './screens/form_offer.dart';
import './screens/product_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Pinjemin',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(primarySwatch: Colors.orange, accentColor: Colors.white),
        home: RequestScreen(),
        routes: {
          LoginPage.tag: (context) => LoginPage(),
          RequestScreen.tag: (context) => RequestScreen(),
          Register.tag: (context) => Register(),
          RequestPage.tag: (context) => RequestPage(),
          OfferPage.tag: (context) => OfferPage(),
          FormReq.tag: (context) => FormReq(),
          FormOffer.tag: (context) => FormOffer(),
          ProductDetailScreen.tag: (context) => ProductDetailScreen()
        },
      ),
    );
  }
}
