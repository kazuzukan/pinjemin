import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            // Navigator.of(context).pushNamed(
            //   // ProductDetailScreen.routeName,
            //   // arguments: product.id,
            // );
          },
          child: Image.network(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
