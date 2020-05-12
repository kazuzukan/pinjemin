import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import './product_card.dart';

class ProductsGrid extends StatelessWidget {
  //bool  true: offer, false: request
  final bool type;

  ProductsGrid({
    this.type
  });

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = type ? productsData.offerItems : productsData.requestItems;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductCard(type: this.type),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
