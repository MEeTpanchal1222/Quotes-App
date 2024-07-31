// lib/views/quote_detail_view.dart
import 'package:flutter/material.dart';
import '../modals/quote.dart';

class QuoteDetailView extends StatelessWidget {
  final Quote quote;

  QuoteDetailView({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote Detail'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quote.quote,
              style: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            Text(
              '- ${quote.author}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Category: ${quote.category}',
              style: TextStyle(fontSize: 16.0),
            ),
            // Add more details and features here
          ],
        ),
      ),
    );
  }
}
