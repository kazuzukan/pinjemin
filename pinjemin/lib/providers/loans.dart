import 'dart:convert';
import 'package:flutter/material.dart';
import 'loan.dart';
import 'package:http/http.dart' as http;

class Loans with ChangeNotifier {
  static final ip = "192.168.55.20:3000";
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
    await Future.forEach(data, (loan) async {
      String _ownersName = await getUserName(loan['ownersUserId'].toString());
      bool callToActionActive;
      String callToAction;

      if (loan['status'] == 'pending-loaners') {
        callToActionActive = true;
        callToAction = 'confirm';
      } else if (loan['status'] == 'pending-owners') {
        callToActionActive = false;
        callToAction = 'waiting confirmation';
      }

      _loadedLoans.add(Loan(
          id: loan['id'],
          name: loan['name'],
          point: loan['point'],
          status: loan['status'],
          productName: loan['product']['name'],
          ownersName: _ownersName,
          loanersName: name,
          callToAction: callToAction,
          callToActionActive: callToActionActive));
    });

    _loansFrom = _loadedLoans;
    notifyListeners();
  }

  Future<void> addLoansToUser(String name, data) async {
    _loansTo = [];

    await Future.forEach(data, (loan) async {
      String _loanersname = await getUserName(loan['loanersUserId'].toString());
      bool callToActionActive;
      String callToAction;

      if (loan['status'] == 'pending-loaners') {
        callToActionActive = false;
        callToAction = 'waiting confirmation';
      } else if (loan['status'] == 'pending-owners') {
        callToActionActive = true;
        callToAction = 'confirm';
      }

      _loansTo.add(Loan(
          id: loan['id'],
          name: loan['name'],
          point: loan['point'],
          status: loan['status'],
          productName: loan['product']['name'],
          loanersName: _loanersname,
          ownersName: name,
          callToAction: callToAction,
          callToActionActive: callToActionActive));
    });

    notifyListeners();
  }

  Future<String> getUserName(String userId) async {
    try {
      final res = await http.get(url + 'user/' + userId);
      final response = json.decode(res.body);

      if (response['is_success']) {
        String fullname =
            response['data']['firstname'] + ' ' + response['data']['lastname'];
        return fullname;
      } else {
        return '(nama)';
      }
    } catch (error) {
      throw (error);
    }
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
        _loans = new List.from(_loans.reversed);
      }
    } catch (error) {
      throw (error);
    }
  }

  Future<dynamic> createLoan(Loan loan) async {
    try {
      final res = await http.post(
        url + 'loan',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': loan.name,
          'point': loan.point,
          'status': loan.status,
          'startDate': loan.startDate.toString(),
          'endDate': loan.endDate.toString(),
          'productId': loan.productId,
          'ownersUserId': loan.ownersUserId,
          'loanersUserId': loan.loanersUserId,
        }),
      );

      final response = json.decode(res.body);

      return response;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
