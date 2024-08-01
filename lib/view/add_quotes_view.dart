// lib/views/add_quote_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/controllers/QuoteController.dart';
import 'package:pr_7_db_miner/modals/quote.dart';

class AddQuoteView extends StatelessWidget {
  final QuoteController quoteController = Get.find();
  final TextEditingController quoteControllerText = TextEditingController();
  final TextEditingController authorControllerText = TextEditingController();
  final TextEditingController categoryControllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Quote'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: quoteControllerText,
              decoration: InputDecoration(labelText: 'Quote'),
            ),
            TextField(
              controller: authorControllerText,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: categoryControllerText,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newQuote = Quote(
                  quote: quoteControllerText.text,
                  author: authorControllerText.text,
                  category: categoryControllerText.text,
                );
                quoteController.addQuote(newQuote);
                Get.back();
              },
              child: Text('Add Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
