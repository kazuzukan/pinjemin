import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './request_screen.dart';
import 'register.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email, _password, _error;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        print('Sign in : ${user.uid}');
        Navigator.push(context, MaterialPageRoute(builder: (context) => RequestScreen()));
      }
      catch(e){
        print('Error : $e');
        setState(() {
          _error = "Incorrect Email or Password!";
        });
      }
    }
  }

  //For Email Verification we using RegEx.
  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  //Alert Message
  Widget showAlert() {
    if (_error != null) {
      return RaisedButton(
        onPressed: () {
          setState(() {
            _error = null;
          });
        },
        color: Colors.white,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 20.0),
            ),
            Expanded(
              child: AutoSizeText(_error),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

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

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: validateEmail,
      onSaved: (value) => _email = value,
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
      onSaved: (value) => _password = value,
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: validateAndSubmit,
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
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
              color: Colors.amber[300],
              icon: Icon(Icons.menu),
              onPressed: () {
                print("Clicked");
              }),
          elevation: 0,
        ),
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
              child: Form(
                key: formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  children: <Widget>[
                    showAlert(),
                    logo,
                    SizedBox(height: 100.0),
                    email,
                    SizedBox(height: 8.0),
                    password,
                    SizedBox(height: 28.0),
                    loginButton,
                    registerLabel
                  ],
                ),
              ),
            )));
  }

  // void signIn() async {
  //   if(formKey.currentState.validate()){
  //     formKey.currentState.save();
  //     try{
  //       FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password) as FirebaseUser;
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  //     }catch(e){
  //       print(e.message);
  //     }
  //   }
  // }
}
