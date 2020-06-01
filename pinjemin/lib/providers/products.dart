import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/http_exception.dart';
import './product.dart';
import 'package:pinjemin/providers/section.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  /* Change IP to your current Local Computer Ip Addres 
     on the same network as your Android Device or Emulator */
     
  static final ip = "pinjemin-app.herokuapp.com";
  final urlProduct = 'https://${ip.toString()}/product';
  final urlSection = 'https://${ip.toString()}/section';
  final urlRequestSection = 'https://${ip.toString()}/request-section';
  final urlOfferSection = 'https://${ip.toString()}/offer-section';
  List<Product> _requestItems = [
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

  List<Product> _offerItems = [];

  List<Product> get offerItems {
    return [..._offerItems];
  }

  List<Product> get requestItems {
    return [..._requestItems];
  }

  Product findById({int id, bool type}) {
    //bool  true: offer, false: request
    if (type) {
      return _offerItems.firstWhere((prod) => prod.id == id);
    } else {
      return _requestItems.firstWhere((prod) => prod.id == id);
    }
  }

  Future<void> fetchRequestProduct() async {
    try {
      final response = await http.get(urlRequestSection);
      final extractedData = json.decode(response.body);
      final List<Product> loadedProducts = [];
      extractedData.forEach((prod) {
        final product = prod as Map<String, dynamic>;
        DateTime startDateValue;
        DateTime endDateValue;
        int typeValue;
        product.forEach((key, value) {
          if (key == 'startDate') {
            startDateValue = DateTime.parse(value);
          }
          if (key == 'endDate') {
            endDateValue = DateTime.parse(value);
          }
          if (key == 'type') {
            typeValue = value;
          }
          if (key == 'product') {
            loadedProducts.add(Product(
                id: value['id'],
                name: value['name'],
                desc: value['desc'],
                price: value['price'],
                image: value['image'],
                startDate: startDateValue,
                endDate: endDateValue,
                type: typeValue));
          }
        });
      });
      _requestItems = loadedProducts;
      print(loadedProducts);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchOfferProduct() async {
    try {
      final response = await http.get(urlOfferSection);
      final extractedData = json.decode(response.body);
      final List<Product> loadedProducts = [];
      extractedData.forEach((prod) {
        final product = prod as Map<String, dynamic>;
        product.forEach((key, value) {
          if (key == 'product') {
            loadedProducts.add(Product(
                id: value['id'],
                name: value['name'],
                desc: value['desc'],
                price: value['price'],
                image: value['image']));
          }
        });
      });
      _offerItems = loadedProducts;
      notifyListeners();
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
      // print(json.decode(response.body)['id']);
      var prodId = json.decode(response.body)['id'];

      String startD = section.startDate.toString();
      String endD = section.endDate.toString();

      await http.post(
        urlSection,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': prodId,
          'startDate': startD,
          'endDate': endD,
          'type': section.type,
          'productId': prodId,
        }),
      ).then((_) => 
      fetchRequestProduct() ).then((_) => 
      fetchOfferProduct() ).then((_) => 
      notifyListeners() );
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> updateProduct(
      int id, Product newProduct, Section newSection) async {
    var prodIndex;
    if (newSection.type == 1) {
      prodIndex = _offerItems.indexWhere((prod) => prod.id == id);
    } else {
      prodIndex = _requestItems.indexWhere((prod) => prod.id == id);
    }
    if (prodIndex >= 0) {
      final urlNewProduct = '$urlProduct/$id';
      final urlNewSection = '$urlSection/$id';
      await http.put(urlNewProduct,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(<String, dynamic>{
            'name': newProduct.name,
            'desc': newProduct.desc,
            'image': newProduct.image,
            'price': newProduct.price
          }));
      await http.put(urlNewSection,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(<String, dynamic>{
            'startDate': newSection.startDate.toString(),
            'endDate': newSection.endDate.toString(),
            'type': newSection.type,
          }));
      newProduct = new Product(
          id: newProduct.id,
          name: newProduct.name,
          desc: newProduct.desc,
          price: newProduct.price,
          image: newProduct.image,
          startDate: newSection.startDate,
          endDate: newSection.endDate,
          type: newSection.type);
      if (newSection.type == 1) {
        _offerItems[prodIndex] = newProduct;
      } else {
        _requestItems[prodIndex] = newProduct;
      }
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteProduct({int id, bool type}) async {
    final urlDeleteSection = '$urlSection/$id';
    final urlDeleteProduct = '$urlProduct/$id';
    var existingProductIndex;
    var existingProduct;
    if (type) {
      existingProductIndex = _offerItems.indexWhere((prod) => prod.id == id);
      existingProduct = _offerItems[existingProductIndex];
      _offerItems.removeAt(existingProductIndex);
    } else {
      existingProductIndex = _requestItems.indexWhere((prod) => prod.id == id);
      existingProduct = _requestItems[existingProductIndex];
      _requestItems.removeAt(existingProductIndex);
    }
    notifyListeners();
    final response = await http.delete(urlDeleteSection);
    final response2 = await http.delete(urlDeleteProduct);
    print('Respon Delete Section $response.statusCode');
    print('Respon Delete product $response2.statusCode');
    if (response.statusCode >= 400 || response2.statusCode >= 400) {
      _requestItems.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}
