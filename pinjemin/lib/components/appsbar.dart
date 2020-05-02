import 'package:flutter/material.dart';

class ApplicationBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar : AppBar(
          title: Text("Appbar with tabs")
        )
      ),
    );
  }
}