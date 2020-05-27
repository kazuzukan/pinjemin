import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const tag = '/product-detail';

  //bool type  true: offer, false: request
  final bool type;
  final int prodId;

  ProductDetailScreen({this.type, this.prodId});

  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<Products>(context, listen: false,)
    .findById(this.prodId, this.type);
    String type;
    if (this.type) {
      type = 'Penawaran';
    } 
    else {
      type = 'Permintaan';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail $type"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${loadedProduct.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
             Text(
              '\$${loadedProduct.startDate.toString()}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.desc,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
