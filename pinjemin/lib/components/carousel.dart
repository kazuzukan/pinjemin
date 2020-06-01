import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CarouselComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       children: <Widget>[
          SizedBox(
            height: 400.0,
            width: 360.0,
            child: Carousel(
               images: [
                  Image.asset('assets/welcome-screen-1.png'),
                  Image.asset('assets/welcome-screen-2.png'),
                  Image.asset('assets/welcome-screen-3.png'),
                  //SvgPicture.asset('lib/assets/icons/welcome-screen-1.svg'),
                  //SvgPicture.asset('lib/assets/icons/welcome-screen-2.svg'),
                  //SvgPicture.asset('lib/assets/icons/welcome-screen-3.svg')
                ],
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Colors.black.withOpacity(0.2),
                dotIncreasedColor: Colors.black.withOpacity(0.5),
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.white.withOpacity(0.0),
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