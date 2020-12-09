import 'package:flutter/material.dart';
import 'package:pinjemin/screens/form_offer.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../components/user_product_item.dart';
import './form_req.dart';
import '../providers/users.dart';

class UserProductsScreen extends StatelessWidget {
  static const tag = '/user-products';
  final bool type;

  UserProductsScreen({this.type});

  Future<void> _refreshProducts(BuildContext context, int userId) async {
    await Provider.of<Products>(context, listen: false).fetchMyProducts(userId);
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);

    var productsData;
    var _currentUser = Provider.of<Users>(context, listen: false).currentUser;
    _refreshProducts(context, _currentUser.id);

    if (type) {
      productsData = products.myOfferItems;
    } else {
      productsData = products.myRequestItems;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: type
                ? () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FormOffer()));
                    // Navigator.of(context).pushNamed(FormReq.tag, arguments: id);
                  }
                : () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FormReq()));
                  },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context, _currentUser.id),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: type ? productsData.length : productsData.length,
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
