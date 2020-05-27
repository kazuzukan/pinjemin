import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../screens/edit_product_screen.dart';
import '../screens/form_req.dart';
import '../providers/products.dart';

class UserRequestProductItem extends StatelessWidget {
  final int id;
  final String name;
  final String image;

  UserRequestProductItem(this.id, this.name, this.image);

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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FormReq(),
                     settings: RouteSettings(arguments: id)));
                // Navigator.of(context).pushNamed(FormReq.tag, arguments: id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                try {
                  await Provider.of<Products>(context, listen: false)
                      .deleteRequestProduct(id);
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
