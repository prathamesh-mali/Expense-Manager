import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.mediaQuery,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final MediaQueryData mediaQuery;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
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
              '₹ ${transaction.amount}',
              style: TextStyle(fontWeight: FontWeight.w600),
            )),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(
            transaction.date,
          ),
        ),
        trailing: mediaQuery.size.width > 300
            ? TextButton.icon(
                style:
                    TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
                icon: Icon(
                  Icons.delete,
                ),
                label: const Text(
                  'Delete',
                ),
                onPressed: () => deleteTx(transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).colorScheme.error,
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
