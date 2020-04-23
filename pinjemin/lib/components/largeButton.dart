import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/request_screen.dart';

void main() => runApp(LargeButton());

class LargeButton extends StatelessWidget {
  final List<Widget> widgetsList;
  LargeButton({this.widgetsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 320,
        height: 60,
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(RequestScreen.tag);
          },
          padding: const EdgeInsets.all(18.0),
          color: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 40,
                child: SvgPicture.asset(
                  'lib/assets/icons/icon-google.svg',
                ),
              ),
              Text(
                'Masuk Dengan Google',
                style: TextStyle(color: Colors.black, fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
