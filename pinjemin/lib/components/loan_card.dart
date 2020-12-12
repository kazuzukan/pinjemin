import 'package:flutter/material.dart';
import 'package:pinjemin/assets/fonts/custom_icons.dart';
import 'package:provider/provider.dart';
import '../providers/loan.dart';

class LoanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loan = Provider.of<Loan>(context);
    String _status(String status) {
      switch (status) {
        case "pending-owners":
          return 'menunggu konfirmasi';
        case "pending-loaners":
          return 'menunggu konfirmasi';
        default:
          return 'sedang berlangsung';
      }
    }

    return Container(
        margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        constraints: BoxConstraints(minHeight: 230, minWidth: 500),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 0.5,
          ),
          borderRadius: new BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              loan.name,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(0),
              child: Row(children: <Widget>[
                IconButton(
                    icon: Icon(Custom.iconrequest,
                        size: 20, color: Color.fromARGB(255, 223, 3, 93)),
                    onPressed: () {
                      print("Notification Clicked");
                    }),
                Text(
                  loan.loanersName,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                )
              ])),
          Padding(
              padding: EdgeInsets.all(0),
              child: Row(children: <Widget>[
                IconButton(
                    icon: Icon(Custom.iconoffer,
                        size: 20, color: Color.fromARGB(255, 54, 57, 164)),
                    onPressed: () {
                      print("Notification Clicked");
                    }),
                Text(
                  loan.ownersName,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                )
              ])),
          Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.shopping_bag,
                        size: 20, color: Color.fromARGB(255, 254, 178, 1)),
                    onPressed: () {
                      print("Notification Clicked");
                    }),
                Text(
                  loan.productName,
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.all(0),
              child: Column(children: <Widget>[
                Container(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        _status(loan.status),
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.red,
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            loan.callToAction,
                            style: TextStyle(fontSize: 12),
                          ),
                          onPressed: loan.callToActionActive ? () {} : null),
                    ),
                  ],
                ))
              ])),
        ]));
  }
}
