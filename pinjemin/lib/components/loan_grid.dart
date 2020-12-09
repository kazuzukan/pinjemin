import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './loan_card.dart';
import '../providers/loans.dart';
import '../providers/users.dart';

class LoansGrid extends StatefulWidget {
  @override
  _LoansGridState createState() => _LoansGridState();
}

class _LoansGridState extends State<LoansGrid> {
  var _isInit = true;
  var _isLoading = false;
  Future<void> _fetchApiLoans(int userId) async {
    await Provider.of<Loans>(context, listen: false)
        .fetchLoans(userId.toString());
  }

  @override
  void initState() {
    super.initState();
    var _currentUser = Provider.of<Users>(context, listen: false).currentUser;

    _fetchApiLoans(_currentUser.id);
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      var _currentUser = Provider.of<Users>(context, listen: false).currentUser;
      _fetchApiLoans(_currentUser.id);

      setState(() {
        _isLoading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loansData = Provider.of<Loans>(context).loans;

    return Container(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: loansData.length,
                itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                  value: loansData[i],
                  child: LoanCard(),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 9 / 7,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
              ));
  }
}
