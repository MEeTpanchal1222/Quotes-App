// lib/views/add_quote_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/QuoteController.dart';
import '../modals/quote.dart';


class AddQuoteView extends StatelessWidget {
  final QuoteController quoteController = Get.find();
  final TextEditingController quoteControllerText = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

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
              controller: authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final quote = Quote(
                  quote: quoteControllerText.text,
                  author: authorController.text,
                  category: categoryController.text,
                );
                quoteController.addQuote(quote);
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
