import './widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                subtitle1: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20)))),
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //     id: '1', title: 'New Shoes', amount: 18.99, date: DateTime.now()),
    // Transaction(id: '2', title: 'Mobile', amount: 199.9, date: DateTime.now()),
    // Transaction(id: '3', title: 'Suit', amount: 19.9, date: DateTime.now()),
    // Transaction(
    //   id: '4',
    //   title: 'watch',
    //   amount: 20.1,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: '7',
    //   title: 'Shirt',
    //   amount: 15.2,
    //   date: DateTime.now(),
    // )
  ];

  void _addNewTransaction(String title, double amount) {
    final newTX = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTX);
    });
  }

  void _startNewAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _startNewAddTransaction(context),
              icon: Icon(
                Icons.add,
              ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startNewAddTransaction(context),
        child: Icon(Icons.add),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Theme.of(context).primaryColor,
              elevation: 5,
              child: Text('Chart!'),
            ),
          ),
          // NewTransaction(_addNewTransaction),
          TransactionList(_userTransaction),
        ],
      ),
    );
  }
}
