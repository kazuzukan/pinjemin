import 'package:flutter/foundation.dart';

class User with ChangeNotifier{
  final int id;
  final String firstname;
  final String email;

  User({
    this.id,
    this.firstname,
    this.email
  });
}