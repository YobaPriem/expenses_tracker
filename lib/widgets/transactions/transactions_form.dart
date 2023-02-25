import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionsForm extends StatelessWidget {
  TransactionsForm({super.key, required this.onSubmitCallback});

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function(String, double) onSubmitCallback;

  void submit () {
    final double? amount = double.tryParse(amountController.text);

    if (titleController.text.isEmpty || amount == null || amount < 0) {
      return;
    }
    onSubmitCallback(titleController.text, amount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submit(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(labelText: 'amount'),
              controller: amountController,
              onSubmitted: (_) => submit(),
            ),
            TextButton(
              onPressed: submit,
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.purple),
              )
            )
          ],
        ),
      ),
    );
  }
}
