import 'package:flutter/material.dart';
import 'package:pinjemin/assets/fonts/custom_icons.dart';

class BottomButtonBar extends StatelessWidget {

  


  @override
  Widget build(BuildContext context) {

    return new Theme(
      data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Color.fromARGB(255,54, 57, 164),
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: new TextStyle(
                  color: Colors
                      .white))
                      ), // sets the inactive color of the `BottomNavigationBar`
      child : BottomAppBar(
        child: Container(
        height: 55,
        width: double.infinity,
        color: Colors.blue,
        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                            child: RaisedButton(
                              child: Text(
                                'Pinjemin',
                                style: TextStyle(color: Colors.white),
                                ),
                                color :Color.fromARGB(255,54, 57, 164),
                                onPressed: () {
                                  null;
                                },
                              ),
                        ),
      ),
      )
    );
  }
}
