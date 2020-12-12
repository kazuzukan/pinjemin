import 'package:flutter/material.dart';
import './loan_card.dart';
import 'package:provider/provider.dart';
import '../providers/loans.dart';

class LoansGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loansData = Provider.of<Loans>(context).loans;

    return Container(
        child: GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loansData.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loansData[i],
        child: LoanCard(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 9 / 7,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
    ));
  }
}
