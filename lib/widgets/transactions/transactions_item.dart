import 'dart:ui';

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
                width: 2,
                color: Theme.of(context).primaryColor
              )
            ),
            child: Text(
              '${transaction.amount.toStringAsFixed(2)} ₽',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).primaryColor
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
                style: const TextStyle(
                  fontVariations: [
                    FontVariation('wght', 600)
                  ],
                ),
              ),
              Text(
                DateFormat('dd MMMM yyyy', 'ru').format(transaction.date),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey
                )
              )
            ]
          )
        ],
    );
  }
}