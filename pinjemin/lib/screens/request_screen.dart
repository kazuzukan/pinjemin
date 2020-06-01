import 'package:flutter/material.dart';
import '../components/products_grid.dart';
import '../screens/form_req.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
// import '../screens/product_detail_screen.dart';
// import '../screens/productdetailoffer.dart';
// import '../screens/productdetailreq.dart';
// import '../components/bottomnav.dart';

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

  Future<void> _refreshRequestProduct() async {
    await Provider.of<Products>(context, listen: false).fetchRequestProduct();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context, listen: false).fetchRequestProduct().then((_) {
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
          controller: null,
          autofocus: false,
          style:
              new TextStyle(fontSize: 14.0, color: Colors.black, height: 1.5),
          decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Cari barang . . .',
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            focusedBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.white),
              borderRadius: new BorderRadius.circular(10),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.blue),
              borderRadius: new BorderRadius.circular(10),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {
                print("settings");
              }),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          heroTag: null,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FormReq()));
          },
          child: Icon(Icons.add)),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => _refreshRequestProduct(),
              child: ProductsGrid(type: false)),
    );
  }
}
