import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../components/user_request_product_item.dart';
import './form_req.dart';

class UserRequestProductsScreen extends StatelessWidget {
  static const tag = '/user-request-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context).fetchRequestProduct();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FormReq()));
              // Navigator.of(context).pushNamed(FormReq.tag, arguments: id);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productsData.requestItems.length,
            itemBuilder: (_, i) => Column(
              children: [
                UserRequestProductItem(
                  productsData.requestItems[i].id,
                  productsData.requestItems[i].name,
                  productsData.requestItems[i].image,
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
