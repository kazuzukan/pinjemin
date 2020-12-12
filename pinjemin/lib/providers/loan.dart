import 'package:flutter/foundation.dart';

class Loan with ChangeNotifier {
  final int id;
  final String name;
  final int ownersUserId;
  final String ownersName;
  final int loanersUserId;
  final String loanersName;
  final String address;
  final DateTime startDate;
  final DateTime endDate;
  final int point;
  final String status;
  final int productId;
  final String productName;
  final bool callToActionActive;
  final String callToAction;

  Loan(
      {this.id,
      this.name,
      this.ownersUserId,
      this.ownersName,
      this.loanersUserId,
      this.loanersName,
      this.address,
      this.startDate,
      this.endDate,
      this.point,
      this.status,
      this.productId,
      this.productName,
      this.callToAction,
      this.callToActionActive});
}
