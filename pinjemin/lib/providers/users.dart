import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './user.dart';
import 'package:http_middleware/http_middleware.dart';
import 'package:http/http.dart' as http;
// import 'package:http_logger/http_logger.dart';

class Users with ChangeNotifier {
  /* Change IP to your current Local Computer Ip Addres 
     on the same network as your Android Device or Emulator */
  static final ip = "192.168.55.20:3000";
  // static final ip = "pinjemin-app.herokuapp.com";
  static final urls = 'http://${ip.toString()}/';
  final urlUser = urls + 'user';

  HttpWithMiddleware httpClient = HttpWithMiddleware.build(middlewares: [
    // to Log http request
    // HttpLogger(logLevel: LogLevel.BODY),
  ]);

  String token = '';
  User currentUser;

  List<User> _userDetail = [];
  List<User> get userDetail {
    return [..._userDetail];
  }

  Future<dynamic> login(User user) async {
    final url = urls + 'auth/login';
    try {
      final http.Response response = await httpClient.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, dynamic>{'email': user.email, 'password': user.password}),
      );

      var res = json.decode(response.body);

      if (res['status']) {
        token = res['token'];
        var user = res['results'];
        currentUser = User(
            id: user['id'],
            firstname: user['firstname'],
            lastname: user['lastname'],
            email: user['email'],
            phone: user['phone'],
            address: user['address'],
            gender: user['gender'],
            point: user['point'],
            isambassador: user['isambassador']);
      }

      notifyListeners();

      return res;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<dynamic> register(User user) async {
    final url = urls + 'auth/register';
    try {
      final http.Response response = await httpClient.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': user.email,
          'firstname': user.firstname,
          'lastname': user.lastname,
          'password': user.password,
          'address': user.address,
          'phone': user.phone,
          'gender': user.gender,
          'point': 0,
          'isambassador': false
        }),
      );

      var res = json.decode(response.body);

      notifyListeners();

      return res;
    } catch (error) {
      print(error);
      throw (error);
    }
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
          'lastname': user.lastname,
          'password': user.password
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
      extractedData.forEach((val) {
        final user = val as Map<String, dynamic>;
        user.forEach((key, value) {
          // print({ key, value});
          // print(value);
          if (key == 'firstname') {
            typeName = value;
          }

          if (key == 'point') {
            typePoint = value;
          }
          if (key == 'email') {
            typeEmail = value;
            loadedUser.add(
                User(firstname: typeName, email: typeEmail, point: typePoint));
          }
        });
      });
      _userDetail = loadedUser;
      print(typePoint);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
