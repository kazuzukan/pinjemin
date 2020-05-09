import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  static const tag = '/transaction-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Histori Transaksi",
          style: new TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}