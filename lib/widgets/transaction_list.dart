import 'package:daily_expanse/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/user_transactions.dart';


class TransactionList extends StatelessWidget {

  late final List<Transaction> transactions;


  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          elevation: 4,
          child: Row(
            children: [
              Container(
                child: Text(
                  '\$${tx.amount}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2)),
                padding: EdgeInsets.all(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    DateFormat.yMMMd().format(tx.date),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
