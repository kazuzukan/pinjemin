import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pinjemin/providers/section.dart';
import './product.dart';
import './user.dart';
import 'package:http/http.dart' as http;

class Users with ChangeNotifier {
  /* Change IP to your current Local Computer Ip Addres 
     on the same network as your Android Device or Emulator */
  static final ip = "192.168.43.220:3000";
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
