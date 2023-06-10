import 'package:expenses_manager/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(children: <Widget>[
              Text('No transactions added yet',
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 20),
              SizedBox(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/no-transaction.png',
                  fit: BoxFit.cover,
                ),
              )
            ]);
          })
        : Padding(
            padding: const EdgeInsets.fromLTRB(15.5, 0, 15.5, 10),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionItem(
                    transaction: transactions[index],
                    mediaQuery: mediaQuery,
                    deleteTx: deleteTx);
              },
              itemCount: transactions.length,
            ),
          );
  }
}
