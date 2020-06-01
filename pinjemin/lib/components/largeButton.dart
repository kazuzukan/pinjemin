import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user.dart';
import '../providers/users.dart';
import 'package:pinjemin/screens/main_screen.dart';
import '../screens/main_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LargeButton extends StatefulWidget {
  final List<Widget> widgetsList;
  LargeButton({this.widgetsList});
  @override
  _LargeButtonState createState() => _LargeButtonState();
}

class _LargeButtonState extends State<LargeButton> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

   _login() async{
    try{
      await _googleSignIn.signIn();
      _saveUser();
      setState(() {
        Navigator.of(context).pushReplacementNamed(MainScreen.tag);
      });
    } catch (err){
      print(err);
    }
  }

  Future<void> _saveUser() async {
    var inputUser = User(
      email: _googleSignIn.currentUser.email, 
      firstname: _googleSignIn.currentUser.displayName
    );
    try{
       await Provider.of<Users>(context, listen: false)
            .addUser(inputUser);
    } catch (error) {
       print(error);
      throw (error);
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
}
