import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String name;
  final String desc;
  final String method;
  final double price;
  final String duration;
  final String image;
  

  Product({
    @required this.name, 
    this.desc,
    this.method,
    this.price ,
    this.duration,
    this.image
  });
}