import 'package:flutter/material.dart';
import 'package:pinjemin/components/bottombuttonreq.dart';
// import 'package:provider/provider.dart';
// import '../providers/products.dart';



class ProductDetailReq extends StatelessWidget {
  static const tag = '/product-detail-request';
  //final String title = "Upload Image Demo";
  //bool type  true: offer, false: request
  //final bool type;
  //final int prodId;
  //ProductDetailScreen({this.type, this.prodId});



 
@override
  Widget build(BuildContext context) {
    
    /*final loadedProduct = Provider.of<Products>(context, listen: false,)
    .findById(this.prodId, this.type);
    String type;
    if (this.type) {
      type = 'Penawaran';
    } 
    else {
      type = 'Permintaan';
    }*/


   return Scaffold(
      appBar: AppBar(
        title: Text('Detail Permintaan'),
        //title: Text("Detail $type"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container( 
              height: 400,
              color: Colors.white,
              width: double.infinity,
              child: Image.asset( //image.network
                'assets/softbox.jpg',
                //loadedProduct.image,
                fit: BoxFit.fill,
              )
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: 60, 
                maxHeight: double.infinity,
                minWidth: double.infinity, 
                maxWidth: double.infinity),
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(5,0,5,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '1600 Watt Softbox Lighting Kit Video Lighting Kit Two Softbox', 
                    textAlign: TextAlign.justify, 
                    style: TextStyle(fontSize: 18),
                  ), //loadproductname
                  /*Text(
                    'Rp. 100.000',
                    //'\$${loadedProduct.price}',
                    style: TextStyle(
                      color: Color.fromARGB(255,223, 3, 93),
                      fontSize: 16, fontWeight: FontWeight.bold
                    ),
                  ),*/
                ]
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: 80, 
                maxHeight: double.infinity,
                minWidth: double.infinity,
                maxWidth: double.infinity
                ),
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(5,10,5,10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Rincian produk', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 14)
                      ),
                  Text(
                    'Haloo aku lagi butuh softbox secepatnya, tenang ada fee nya kok. Detail ukuran:'
                    '\n- 8 x 45watt Flourescent Bulb\n- 2 x lightstand by Fancierstudio 9004S'
                    '\nDiperlukan untuk kepanitiaan.\nHub WA : 08xxxxxxxxx\nline : jokovvi',
                    //loadedProduct.desc,
                    style: TextStyle(
                      fontSize: 14, fontWeight : FontWeight.w400
                    ),
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                  
                ],
              ),
            )
          ],
        ),   
      ),
    bottomNavigationBar: BottomButtonReq(),
    );
  }
}
