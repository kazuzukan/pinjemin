import 'package:flutter/foundation.dart';

class Loan with ChangeNotifier {
  final int id;
  final String name;
  final String ownersName;
  final String loanersName;
  final String address;
  final DateTime startDate;
  final DateTime endDate;
  final int point;
  final String status;
  final int productId;
  final String productName;

  Loan(
      {this.id,
      this.name,
      this.ownersName,
      this.loanersName,
      this.address,
      this.startDate,
      this.endDate,
      this.point,
      this.status,
      this.productId,
      this.productName});
}
