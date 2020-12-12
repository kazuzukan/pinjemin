import 'package:flutter/material.dart';
import 'package:pinjemin/components/loan_grid.dart';
import 'package:provider/provider.dart';
import '../providers/loans.dart';
import '../providers/users.dart';

class TransactionScreen extends StatefulWidget {
  static const tag = '/transaction-screen';

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _fetchApiLoans() async {
    var _currentUser = Provider.of<Users>(context, listen: false).currentUser;
    await Provider.of<Loans>(context, listen: false)
        .fetchLoans(_currentUser.id.toString());
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      _fetchApiLoans();

      setState(() {
        _isLoading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Histori Transaksi",
            style: new TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () => _fetchApiLoans(), child: LoansGrid()));
  }
}
