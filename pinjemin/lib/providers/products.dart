import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pinjemin/providers/section.dart';
import './product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  /* Change IP to your current Local Computer Ip Addres 
     on the same network as your Android Device or Emulator */
  final urlProduct = 'http://192.168.43.158:3000/product';
  final urlSection = 'http://192.168.43.158:3000/section';
  List<Product> _items = [
    // Product(
    //   name: 'Red Shirt',
    //   desc: 'Mau minjem kaos merah dong minggu depan! hehe untuk keperluan kepanitiaan gue nic',
    //   price: 29.99,
    //   image:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   name: 'Trousers',
    //   desc: 'Urgent! butuh celana chino warna krem buat pementasan seni Forsi 2020',
    //   price: 59.99,
    //   image:
    //       'https://images.evo.com/imgp/700/159426/676754/brixton-aberdeen-trouser-pants-women-s-.jpg',
    // ),
    // Product(
    //   name: 'Blue Scarf',
    //   desc: 'Gaes ada yang punya syal yang bisa dipakai minggu ini ga?',
    //   price: 19.99,
    //   image:
    //       'https://www.cleo.ca/on/demandware.static/-/Sites-product-catalog/default/dw8a0d56a9/images/cleo/accessories/9289fw17shmb_400_1.jpg',
    // ),
    // Product(
    //   name: 'A Pan',
    //   desc: 'Butuh panci stainless steel segera untuk makan-makan di puri indah',
    //   price: 49.99,
    //   image:
    //       'https://cdn.shopify.com/s/files/1/2131/5111/products/carbon-steel-mobile-1_grande.jpg?v=1587166842',
    // ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findByName(String name) {
    return _items.firstWhere((prod) => prod.name == name);
  }

  Future<void> fetchProduct() async {
    try {
      final response = await http.get(urlProduct);
      final extractedData = json.decode(response.body);
      final List<Product> loadedProducts = [];
      extractedData.forEach((prod) {
        loadedProducts.add(Product(
            id: prod['id'],
            name: prod['name'],
            desc: prod['desc'],
            price: prod['price'],
            image: prod['image']));
      });
      _items = loadedProducts;
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(Product product, Section section) async {
    try {
      final response = await http.post(
        urlProduct,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': product.name,
          'desc': product.desc,
          'image': product.image,
          'price': product.price,
        }),
      );
      print(json.decode(response.body)['id']);
      var prodId = json.decode(response.body)['id'];
      String startD = section.startDate.toString();
      String endD = section.endDate.toString();
      print(startD); print(endD);
      final response2 = await http.post(
        urlSection,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'startDate': startD,
          'endDate': endD,
          'type': section.type,
          'productId': prodId,
        }),
      ); 
      print(jsonEncode(<String, dynamic>{
          'startDate': startD,
          'endDate': endD,
          'type': section.type,
          'productId': prodId,
        }));
      print(response2);
      fetchProduct();
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
