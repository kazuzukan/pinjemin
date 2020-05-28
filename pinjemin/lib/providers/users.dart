import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pinjemin/providers/section.dart';
import './product.dart';
import './user.dart';
import 'package:http/http.dart' as http;

class Users with ChangeNotifier {
  /* Change IP to your current Local Computer Ip Addres 
     on the same network as your Android Device or Emulator */
  static final ip = "pinjemin-app.herokuapp.com";
  final urlUser = 'http://${ip.toString()}/user';

  Future<void> addUser(User user) async {
    try{
      await http.post(
        urlUser,
         headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': user.email,
          'firstname': user.firstname,
        }),
      );

      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
