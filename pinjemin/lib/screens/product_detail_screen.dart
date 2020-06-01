import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import 'package:pinjemin/components/bottombuttonreq.dart';
import 'package:pinjemin/components/bottombuttonoffer.dart';

class ProductDetailScreen extends StatelessWidget {
  static const tag = '/product-detail';

  //bool type  true: offer, false: request
  final bool type;
  final int prodId;

  ProductDetailScreen({this.type, this.prodId});

  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(id: this.prodId, type: this.type);
    String type;
    if (this.type) {
      type = 'Penawaran';
    } else {
      type = 'Permintaan';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail $type"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: 400,
                  color: Colors.white,
                  width: double.infinity,
                  child: Hero(
                    tag: 'imgProduct',
                    child: Image.network(
                      loadedProduct.image,
                      fit: BoxFit.fill,
                    ),
                  )),
              Container(
                constraints: BoxConstraints(
                    minHeight: 60,
                    maxHeight: double.infinity,
                    minWidth: double.infinity,
                    maxWidth: double.infinity),
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${loadedProduct.name}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ), //load product name
                      (() {
                        if (this.type) {
                          return Text('${loadedProduct.price} poin',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 223, 3, 93),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold));
                        } else {
                          String startDate = DateFormat("d MMMM y")
                              .format(loadedProduct.startDate);
                          String endDate = DateFormat("d MMMM y")
                              .format(loadedProduct.endDate);
                          return Text('$startDate - $endDate',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 119, 0),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700));
                        }
                      }()),
                    ]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                constraints: BoxConstraints(
                    minHeight: 80,
                    maxHeight: double.infinity,
                    minWidth: double.infinity,
                    maxWidth: double.infinity),
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Rincian produk',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.8))),
                    Text(
                      '${loadedProduct.desc}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.6)),
                      textAlign: TextAlign.justify,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            this.type ? BottomButtonOffer() : BottomButtonReq());
  }
}
