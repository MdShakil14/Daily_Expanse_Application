import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  late final Function addTx;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              //onChanged: (value) => title=value,
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            ElevatedButton(
              onPressed: () {
                addTx(titleController.text,double.parse(amountController.text));
              },
              child: Text('Add Transaction'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
