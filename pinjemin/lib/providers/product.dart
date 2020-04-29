import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final int id;
  final String name;
  final String desc;
  final String method;
  final int price;
  final String duration;
  final String image;
  

  Product({
    this.id,
    this.name, 
    this.desc,
    this.method,
    this.price ,
    this.duration,
    this.image
  });
}