import 'package:flutter/material.dart';

class ChartItem extends StatelessWidget {
  final String day;
  final double amount;
  final double percentage;

  const ChartItem({
    super.key,
    required this.day,
    required this.amount,
    required this.percentage
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day),
        const SizedBox(height: 8),
        SizedBox(
          height: 64,
          width: 16,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0
                  ),
                  color: const Color.fromARGB(1, 220, 220, 220),
                  borderRadius: BorderRadius.circular(24)
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(24)
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        FittedBox(
          child: Text('${amount.toStringAsFixed(0)} ₽'),
        )
      ],
    );
  }
}