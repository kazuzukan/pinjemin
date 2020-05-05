import 'package:flutter/foundation.dart';

class Section with ChangeNotifier {
  final int id;
  final DateTime startDate;
  final DateTime endDate;
  final int type;

  Section({
    this.id,
    this.startDate,
    this.endDate,
    this.type
  });
}