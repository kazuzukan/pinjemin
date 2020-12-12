import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/loan.dart';
import '../providers/loans.dart';
import '../providers/product.dart';
import '../providers/users.dart';
import '../screens/transaction_screen.dart';
// import 'package:pinjemin/assets/fonts/custom_icons.dart';

class BottomButtonReq extends StatefulWidget {
  final Product product;
  const BottomButtonReq({Key key, this.product}) : super(key: key);

  @override
  _BottomButtonReqState createState() => _BottomButtonReqState();
}

class _BottomButtonReqState extends State<BottomButtonReq> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();
  var loanName = TextEditingController();
  var loanPoint = TextEditingController();

  Future<void> _onLoan() async {
    setState(() {
      _isLoading = true;
    });

    var _currentUser = Provider.of<Users>(context, listen: false).currentUser;
    var loan = Loan(
        name: loanName.text,
        point: int.parse(loanPoint.text),
        status: 'pending-loaners',
        startDate: widget.product.startDate,
        endDate: widget.product.endDate,
        productId: widget.product.id,
        ownersUserId: _currentUser.id,
        loanersUserId: widget.product.userId);

    try {
      var res =
          await Provider.of<Loans>(context, listen: false).createLoan(loan);

      setState(() {
        _isLoading = false;
      });

      if (res['is_success']) {
        Navigator.of(context).pop(true);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TransactionScreen()));
      } else {
        await showDialog(
            context: context,
            builder: (ctx) {
              Future.delayed(Duration(seconds: 5), () {
                Navigator.of(ctx).pop(true);
              });

              return AlertDialog(
                  content: Text(
                    res['messages'],
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.white),
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  backgroundColor: Colors.redAccent);
            });
      }
    } catch (error) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An error occurred!'),
          content: Text('Something went wrong.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay', style: TextStyle(color: Colors.black87)),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _pinjemDialog() async {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('Pinjem'),
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 25),
                                child: TextFormField(
                                    controller: loanName,
                                    decoration: InputDecoration(
                                      labelText: 'Title',
                                      labelStyle:
                                          TextStyle(color: Colors.black54),
                                    ),
                                    cursorColor: Colors.black12,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please provide a value.';
                                      }
                                      return null;
                                    }),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 25),
                                child: TextFormField(
                                  controller: loanPoint,
                                  decoration: InputDecoration(
                                    labelText: 'Price',
                                    labelStyle:
                                        TextStyle(color: Colors.black54),
                                  ),
                                  cursorColor: Colors.black12,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter a point.';
                                    }
                                    if (double.tryParse(value) == null) {
                                      return 'Please enter a valid number.';
                                    }
                                    if (double.parse(value) <= 0) {
                                      return 'Please enter a number greater than zero.';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(70, 30, 70, 16),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _onLoan();
                                  },
                                  color: Color.fromARGB(255, 223, 3, 93),
                                  textColor: Colors.white,
                                  padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
                                  splashColor: Colors.orangeAccent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text("Pinjemin Barang"),
                                ),
                              ),
                            ],
                          ))
              ],
            );
          });
    }

    return new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Color.fromARGB(255, 54, 57, 164),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.white,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: new TextStyle(
                    color: Colors
                        .white))), // sets the inactive color of the `BottomNavigationBar`
        child: BottomAppBar(
          child: Container(
            height: 55,
            width: double.infinity,
            color: Colors.blue,
            child: Column(
                //padding: EdgeInsets.all(0),
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: RaisedButton(
                      child: Text(
                        'Pinjemin Barang',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color.fromARGB(255, 223, 3, 93),
                      onPressed: _pinjemDialog,
                    ),
                  ),
                ]),
          ),
        ));
  }
}
