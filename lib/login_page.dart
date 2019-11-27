import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/pinjemin.png'),
      ),
    );

    final username = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) {
        if (value.isEmpty){
          return 'Please enter username';
        }
        return null;
      },
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),     
      ),
      validator: (value) => value.isEmpty ? 'password Can\'t be empty' : null,
    );


    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(HomePage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final registerLabel = FlatButton(
      child: Text(
        'Register?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
          Navigator.of(context).pushNamed(Register.tag);
        },
    );

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(28.0),
        decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white,
        ]),
      ),
      child: Center(
        child: ListView(
        shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            username,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            registerLabel
          ],
        ),
      ),

      ) 
    );
  }
}
