import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final int id;
  final String name;
  final String desc;
  final String method;
  final int price;
  final String duration;
  final String image;
  final DateTime startDate;
  final DateTime endDate;
  final int type;
  

  Product({
    this.id,
    this.name, 
    this.desc,
    this.method,
    this.price ,
    this.duration,
    this.image,
    this.startDate,
    this.endDate,
    this.type
  });
}