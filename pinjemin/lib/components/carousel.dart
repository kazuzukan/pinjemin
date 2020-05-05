import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       children: <Widget>[
          SizedBox(
            height: 400.0,
            width: 380.0,
            child: Carousel(
               images: [
                  SvgPicture.asset('lib/assets/icons/welcome-screen-1.svg'),
                  // Image.asset('assets/welcome-screen-1.png'),
                  SvgPicture.asset('lib/assets/icons/welcome-screen-2.svg'),
                  SvgPicture.asset('lib/assets/icons/welcome-screen-3.svg')
                ],
                dotSize: 8.0,
                dotSpacing: 15.0,
                dotColor: Colors.grey,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.purple.withOpacity(0.0),
                borderRadius: true,
                moveIndicatorFromBottom: 180.0,
                noRadiusForIndicator: true,
            ),
          )
       ],
      ),
    );
  }
}