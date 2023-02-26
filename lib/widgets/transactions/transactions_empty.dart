import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionsEmpty extends StatelessWidget {
  const TransactionsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('There is no transactions yet'),
        const SizedBox(height: 10),
        SvgPicture.asset(
          'assets/icons/empty.svg',
          semanticsLabel: 'Empty list',
          width: 64,
          height: 64,
        )
      ],
    );
  }
}