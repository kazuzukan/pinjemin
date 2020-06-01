import 'package:flutter/material.dart';
import 'package:pinjemin/screens/form_offer.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../components/user_product_item.dart';
import './form_req.dart';

class UserProductsScreen extends StatelessWidget {
  static const tag = '/user-products';
  final bool type;

  UserProductsScreen({this.type});

  Future<void> _refreshProducts(BuildContext context) async {
    if (type) {
      await Provider.of<Products>(context, listen: false).fetchRequestProduct();
    } else {
      await Provider.of<Products>(context, listen: false).fetchOfferProduct();
    }
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    var productsData;
    if (type) {
      productsData = products.offerItems;
    } else {
      productsData = products.requestItems;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: type
            ? () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FormOffer()));
              // Navigator.of(context).pushNamed(FormReq.tag, arguments: id);
            }
            : () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FormReq()));
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: type
            ? productsData.length
            : productsData.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserProductItem(
                  id: productsData[i].id,
                  name: productsData[i].name,
                  image: productsData[i].image,
                  type: type,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
