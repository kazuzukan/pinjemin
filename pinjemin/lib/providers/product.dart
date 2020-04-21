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
    this.desc = null,
    this.method = null,
    this.price = null,
    this.duration = null,
    this.image = null
  });
}