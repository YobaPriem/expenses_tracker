import 'dart:ui';

import 'package:expenses_tracker/widgets/transactions/transactions_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:expenses_tracker/widgets/transactions/transactions_form.dart';
import 'package:expenses_tracker/models/transaction.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: 'Montserrat',
      primarySwatch: Colors.purple,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 24,
          fontVariations: [
            FontVariation('wght', 500)
          ]
        )
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
        // TODO: ?This might be helpful?
        // displayMedium:  TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // displaySmall:   TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // displayLarge:   TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // headlineLarge:  TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // headlineMedium: TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // headlineSmall:  TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // titleLarge:     TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // titleMedium:    TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // titleSmall:     TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // labelLarge:     TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // labelMedium:    TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // labelSmall:     TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // bodyLarge:      TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // bodyMedium:     TextStyle(fontVariations: [FontVariation('wght', 400)]),
        // bodySmall:      TextStyle(fontVariations: [FontVariation('wght', 400)]),

        titleLarge: const TextStyle(fontVariations: [FontVariation('wght', 400)]),
        bodyMedium: const TextStyle(
          fontSize: 16,
          fontVariations: [FontVariation('wght', 400)]
        ),
        bodySmall: const TextStyle(
          fontSize: 14,
          fontVariations: [FontVariation('wght', 400)]
        )
      )
    );

    return MaterialApp(
      title: 'Exprenses tracker',
      home: const MyHomePage(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.amber),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _showTransactionsForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionsForm(onSubmitCallback: _createTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exprenses tracker'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _showTransactionsForm(context),
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            )
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 3,
            color: Theme.of(context).primaryColor,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text('Chart')),
          ),
          SizedBox(
            height: 325,
            child: ListView.builder(
              itemBuilder: (_, idx) {
                return Card(
                    child: TransactionsItem(transaction: _list[idx]));
              },
              itemCount: _list.length,
            )
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:  FloatingActionButton(
        onPressed: () => _showTransactionsForm(context),
        child: const Icon(Icons.add),
      )
    );
  }
}
