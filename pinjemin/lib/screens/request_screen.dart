import 'package:flutter/material.dart';
import '../components/products_grid.dart';
import '../screens/form_req.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class RequestScreen extends StatefulWidget {
  static String tag = 'request-screen';

  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchProduct().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(hintText: 'Cari Barang. . .'),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.settings_applications),
                onPressed: () {
                  print("settings");
                }),
          ],
        ),
        floatingActionButton: new FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FormReq()));
            },
            child: Icon(Icons.add)),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ProductsGrid());
  }
}
