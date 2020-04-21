import 'package:flutter/material.dart';
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      name: 'Red Shirt',
      desc: 'Mau minjem kaos merah dong minggu depan! hehe untuk keperluan kepanitiaan gue nic',
      price: 29.99,
      image:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      name: 'Trousers',
      desc: 'Urgent! butuh celana chino warna krem buat pementasan seni Forsi 2020',
      price: 59.99,
      image:
          'https://images.evo.com/imgp/700/159426/676754/brixton-aberdeen-trouser-pants-women-s-.jpg',
    ),
    Product(
      name: 'Blue Scarf',
      desc: 'Gaes ada yang punya syal yang bisa dipakai minggu ini ga?',
      price: 19.99,
      image:
          'https://www.cleo.ca/on/demandware.static/-/Sites-product-catalog/default/dw8a0d56a9/images/cleo/accessories/9289fw17shmb_400_1.jpg',
    ),
    Product(
      name: 'A Pan',
      desc: 'Butuh panci stainless steel segera untuk makan-makan di puri indah',
      price: 49.99,
      image:
          'https://cdn.shopify.com/s/files/1/2131/5111/products/carbon-steel-mobile-1_grande.jpg?v=1587166842',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findByName(String name) {
    return _items.firstWhere((prod) => prod.name == name);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }  
}