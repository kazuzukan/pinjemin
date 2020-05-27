import 'package:flutter/material.dart';
import 'package:pinjemin/screens/form_offer.dart';
import 'package:provider/provider.dart';

// import '../screens/edit_product_screen.dart';
import '../screens/form_req.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final bool type;

  UserProductItem({this.id, this.name, this.image, this.type});

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: type
                  ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormOffer(),
                              settings: RouteSettings(arguments: id)));
                    }
                  : () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormReq(),
                              settings: RouteSettings(arguments: id)));
                    },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                try {
                  await Provider.of<Products>(context, listen: false)
                      .deleteProduct(id: id, type: this.type);
                } catch (error) {
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text(
                        'Deleting failed!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
