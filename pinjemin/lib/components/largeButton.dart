import 'package:flutter/material.dart';
// import '../screens/request_screen.dart';
// import '../providers/controller/autentikasi.dart';

import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class LargeButton extends StatefulWidget {
  final List<Widget> widgetsList;
  LargeButton({this.widgetsList});
  @override
  _LargeButtonState createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  bool _isLoggedIn = false;
  
   _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }

  // _logout(){
  //   _googleSignIn.signOut();
  //   setState(() {
  //     _isLoggedIn = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 320,
        height: 60,
        child: RaisedButton(
          onPressed: () {
           _login();
           _isLoggedIn ? print('Masuuuk') : print('Masuuuk');
          },
          padding: const EdgeInsets.all(18.0),
          color: Colors.white,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.widgetsList,
          ),
        ),
      ),
    );
  }

  handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  andleSignOut() async {
    _googleSignIn.disconnect();
  }
}
