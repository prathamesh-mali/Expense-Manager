import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
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
                  style: Theme.of(context).textTheme.headline6),
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
                return Card(
                  color: Color.fromARGB(255, 252, 248, 248),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 6,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text(
                          '₹ ${transactions[index].amount}',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(
                        transactions[index].date,
                      ),
                    ),
                    trailing: mediaQuery.size.width > 300
                        ? TextButton.icon(
                            style: TextButton.styleFrom(
                                primary: Theme.of(context).errorColor),
                            icon: Icon(
                              Icons.delete,
                            ),
                            label: const Text(
                              'Delete',
                            ),
                            onPressed: () => deleteTx(transactions[index].id),
                          )
                        : IconButton(
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => deleteTx(transactions[index].id),
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
          );
  }
}
