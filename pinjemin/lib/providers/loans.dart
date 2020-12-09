import 'dart:convert';
import 'package:flutter/material.dart';
import 'loan.dart';
import 'package:http/http.dart' as http;

class Loans with ChangeNotifier {
  static final ip = "192.168.55.13:3000";
  // static final ip = "pinjemin-app.herokuapp.com";
  static final url = 'http://${ip.toString()}/';

  List<Loan> _loansFrom = [];

  List<Loan> get loansFrom {
    return [..._loansFrom];
  }

  List<Loan> _loansTo = [];

  List<Loan> get loansTo {
    return [..._loansTo];
  }

  List<Loan> _loans = [];

  List<Loan> get loans {
    return [..._loans];
  }

  Future<void> addLoansFromUser(String name, data) async {
    final List<Loan> _loadedLoans = [];
    data.forEach((loan) {
      _loadedLoans.add(Loan(
          id: loan['id'],
          name: loan['name'],
          point: loan['point'],
          status: loan['status'],
          productName: loan['product']['name'],
          ownersName: loan['product']['user']['firstname'] +
              ' ' +
              loan['product']['user']['lastname'],
          loanersName: name));
    });

    _loansFrom = _loadedLoans;
    notifyListeners();
  }

  Future<void> addLoansToUser(String name, data) async {
    final List<Loan> _loadedLoans = [];
    data.forEach((loan) {
      _loadedLoans.add(Loan(
          id: loan['id'],
          name: loan['name'],
          point: loan['point'],
          status: loan['status'],
          productName: loan['product']['name'],
          loanersName: loan['product']['user']['firstname'] +
              ' ' +
              loan['product']['user']['lastname'],
          ownersName: name));
    });

    _loansTo = _loadedLoans;
    notifyListeners();
  }

  Future<void> fetchLoans(String userId) async {
    try {
      final res = await http.get(url + 'user/loan/' + userId);
      final response = json.decode(res.body);

      if (response['is_success']) {
        String name =
            response['data']['firstname'] + ' ' + response['data']['lastname'];

        await addLoansFromUser(name, response['data']['loansFromUser']);
        await addLoansToUser(name, response['data']['loansToUser']);

        _loans = [];
        _loans = new List.from(_loansFrom)..addAll(_loansTo);
      }
    } catch (error) {
      throw (error);
    }
  }
}
