import 'package:flutter/material.dart';
import 'package:pinjemin/request_page.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'register.dart';
import 'request_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    Register.tag: (context) => Register(),
    RequestPage.tag: (context) => RequestPage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kodeversitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
