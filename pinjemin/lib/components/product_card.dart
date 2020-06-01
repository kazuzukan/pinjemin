import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductCard extends StatelessWidget {
  //bool  true: offer, false: request
  final bool type;

  ProductCard({this.type});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                        type: this.type, prodId: product.id)));
          },
          child: Hero(
            tag: 'imgProduct',
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                return progress == null ? child : CircularProgressIndicator();
              },
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.white,
          title: Text(
            product.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          subtitle:
              Text(product.desc, style: Theme.of(context).textTheme.caption),
        ),
      ),
    );
  }
}
