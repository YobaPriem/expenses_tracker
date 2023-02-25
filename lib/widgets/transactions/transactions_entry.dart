import 'package:expenses_tracker/widgets/transactions/transactions_form.dart';
import 'package:expenses_tracker/widgets/transactions/transactions_item.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/transaction.dart';

class TransactionsEntry extends StatefulWidget {
  const TransactionsEntry({super.key});

  @override
  State<TransactionsEntry> createState() => _TransactionsEntry();
}

class _TransactionsEntry extends State<TransactionsEntry> {
  final List<Transaction> _list = [
    Transaction(
      uid: '1sasd', title: 'Снюс', amount: 500.00, date: DateTime.now()),
    Transaction(
      uid: 'sa2ffdf', title: 'Шпак', amount: 267.22, date: DateTime.now())
  ];

  void _createTransaction(String title, double amount) {
    setState(() {
        _list.add(Transaction(
            uid: 'test',
            title: title,
            amount: amount,
            date: DateTime.now()
          )
        );
    });
  }

  @override
  Widget build(BuildContext context) {
  return Column(
      children: [
        TransactionsForm(onSubmitCallback: _createTransaction),
        Container(
          height: 300,
          child: ListView.builder(
            itemBuilder: (_, idx) {
              return Card(child: TransactionsItem(transaction: _list[idx]));
            },
            itemCount: _list.length,
          )
        )
      ],
    );
  }
}