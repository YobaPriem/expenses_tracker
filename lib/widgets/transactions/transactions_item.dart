import 'package:expenses_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsItem extends StatelessWidget {
  const TransactionsItem({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
                width: 2,
              )
            ),
            child: Text(
              '${transaction.amount} ₽',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16
                ),
              ),
              Text(
                DateFormat('dd MMMM yyyy', 'ru').format(transaction.date),
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey
                )
              )
            ]
          )
        ],
    );
  }
}