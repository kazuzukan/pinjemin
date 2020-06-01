import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:pinjemin/providers/section.dart';
// import './product.dart';
import './user.dart';
import 'package:http/http.dart' as http;

class Users with ChangeNotifier {
  /* Change IP to your current Local Computer Ip Addres 
     on the same network as your Android Device or Emulator */
  static final ip = "pinjemin-app.herokuapp.com";
  final urlUser = 'https://${ip.toString()}/user';
  List<User> _userDetail = [];
  List<User> get userDetail {
    return [..._userDetail];
  }
  Future<void> addUser(User user) async {
    try {
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

  Future<void> getUser(String email) async {
    final urlGetUser = '$urlUser/$email';
    try {
      final response = await http.get(urlGetUser);
      final extractedData = json.decode(response.body);
      final List<User> loadedUser = [];
      String typeName;
      String typeEmail;
      int typePoint;
      print(extractedData);
      extractedData.forEach((val){
        final user = val as Map<String, dynamic>;
        user.forEach((key, value) {
          // print({ key, value});
          // print(value);
          if(key == 'firstname'){
            typeName = value;
          }

          if(key == 'point'){
            typePoint = value;
          }
          if(key == 'email'){
            typeEmail = value;
            loadedUser.add(User(
            firstname: typeName,
            email: typeEmail,
            point: typePoint
          ));
          }
          
        });
      });
      _userDetail= loadedUser;
      print(typePoint);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
