import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: '1', title: 'New Shoes', amount: 18.99, date: DateTime.now()),
    Transaction(id: '2', title: 'Mobile', amount: 199.9, date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    final newTX = Transaction(id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTX);
    });
  }




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
