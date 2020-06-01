import 'package:flutter/foundation.dart';

class User with ChangeNotifier{
  final int id;
  final String firstname;
  final String email;
  final String phone;
  final String address;
  final bool gender;
  final int point;
  final bool isambasaddor;

  User({
    this.id,
    this.firstname,
    this.email,
    this.phone,
    this.address,
    this.gender,
    this.point,
    this.isambasaddor
  });
}