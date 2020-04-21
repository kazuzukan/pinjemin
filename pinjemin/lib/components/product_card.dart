import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Card(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.tag,
              arguments: product.name,
            );
          },
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: FittedBox(
                  child: Image.network(product.image),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Text(product.name),
              )
            ],
          ),
        ),
        // footer: GridTileBar(
        //   backgroundColor: Colors.black87,
        //   title: Text(
        //     product.name,
        //     textAlign: TextAlign.center,
        //   ),
        // ),
      ),
    );
  }
}
