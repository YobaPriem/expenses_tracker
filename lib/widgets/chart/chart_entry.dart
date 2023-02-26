import 'package:expenses_tracker/models/chart_day.dart';
import 'package:expenses_tracker/widgets/chart/chart_item.dart';
import 'package:flutter/material.dart';
import 'package:expenses_tracker/models/transaction.dart';
import 'package:intl/intl.dart';

class ChartEntry extends StatelessWidget {
  final List<Transaction> transactionsList;

  const ChartEntry({super.key, required this.transactionsList});

  List<ChartDay> get _groupedByWeekdayTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double total = 0.0;

      for (var i = 0; i < transactionsList.length; i++) {
        if (transactionsList[i].date.year == weekDay.year &&
            transactionsList[i].date.month == weekDay.month &&
            transactionsList[i].date.day == weekDay.day
        ) {
          total += transactionsList[i].amount;
        }
      }

      return ChartDay(
        day: DateFormat.E('ru').format(weekDay),
        amount: total
      );
    });
  }

  double get totalAmountByDays {
    return _groupedByWeekdayTransactions.fold(0.0, (previousValue, element) => previousValue + element.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupedByWeekdayTransactions
            .map((el) => Flexible(
              fit: FlexFit.tight,
              child: ChartItem(
                day: el.day,
                amount: el.amount,
                percentage: totalAmountByDays > 0
                  ? el.amount / totalAmountByDays
                  : 0
              )
            )
          ).toList(),
        ),
      )
    );
  }
}