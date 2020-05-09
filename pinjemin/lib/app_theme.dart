import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color _iconColor = Colors.redAccent.shade200;

  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryVariantColor = Color(0XFFE1E1E1);
  static const Color _lightSecondaryColor = Color.fromARGB(255, 255, 119, 0);
  static const Color _lightOnPrimaryColor = Colors.black;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    appBarTheme: AppBarTheme(
      color: _lightSecondaryColor,
      iconTheme: IconThemeData(color: _lightPrimaryColor),
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryVariantColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
    ),
    iconTheme: IconThemeData(
      color: _iconColor,
    ),
    textTheme: _lightTextTheme,
    fontFamily: 'Poppins'
  );
  
  static final TextTheme _lightTextTheme = TextTheme(
    headline1: _lightScreenHeadingStyle,
    bodyText1: _heading1,
    bodyText2: _heading3,
    caption: _heading3,
    overline: _heading4
  );

  static final TextStyle _lightScreenHeadingStyle = TextStyle(fontSize: 48.0, letterSpacing: 1.2, color: _lightOnPrimaryColor);
  static final TextStyle _heading1 = TextStyle(fontSize: 16.0, color: _lightOnPrimaryColor);
  static final TextStyle _heading3 = TextStyle(fontSize: 12.0, color: Colors.grey);
  static final TextStyle _heading4 = TextStyle(fontSize: 14.0, color: Colors.black);
}
