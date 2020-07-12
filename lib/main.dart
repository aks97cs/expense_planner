import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Planner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PlannerState();
  }
}

class PlannerState extends State<Planner> {
  // void renderState(){
  //   setState(() {
  //     var c=10;
  //   });
  // }
  // String inputTitle;
  // String inputAmount;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final List<Transaction> transaction = [
    //   Transaction(
    //     id: 't1',
    //     title: 'New shoes',
    //     amount: 200,
    //     date: DateTime.now(),
    //   ),
    //   Transaction(
    //     id: 't2',
    //     title: 'New gloves',
    //     amount: 20.5,
    //     date: DateTime.now(),
    //   )
    // ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Planner'),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('card 1'),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      // onChanged: (val) =>inputTitle = val,
                      controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      // onChanged: (val) => inputAmount = val,
                      controller: amountController,
                    ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      onPressed: () {
                        // print(inputTitle);
                        // print(inputAmount);
                        print(titleController.text);
                        print(amountController.text);
                      },
                      textColor: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
            TransactionList(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(Planner());
}
