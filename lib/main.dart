import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_planner/models/transaction.dart';

class Planner extends StatefulWidget {
  @override
  _PlannerState createState() {
    return _PlannerState();
  }
}

class _PlannerState extends State<Planner> {
  
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New shoe',
      amount: 200,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New phone',
      amount: 2000.5,
      date: DateTime.now(),
    ),
    // Transaction(),
  ];

  void _addNewTransaction(String trTitle, double trAmount) {
    final newtr = Transaction(
      title: trTitle,
      amount: trAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(newtr);
    });
  }

  void _startAddNewTransaction(BuildContext ct) {
    showModalBottomSheet(
      context: ct,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Planner'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
              TransactionList(_userTransaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ),
    );
  }
}

void main() {
  runApp(Planner());
}
