import 'package:expenses_tracker/widgets/transactions/transactions_entry.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 3,
            color: Colors.blue,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text('Chart')),
          ),
          const TransactionsEntry()
        ],
      ),
    );
  }
}
