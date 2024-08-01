// lib/views/quote_detail_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/modals/quote.dart';

class QuoteDetailView extends StatelessWidget {
  final Quote quote;

  QuoteDetailView({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              quote.quote,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '- ${quote.author}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Category: ${quote.category}',
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Implement quote wallpaper creation or sharing functionality here
              },
              child: Text('Create Wallpaper'),
            ),
          ],
        ),
      ),
    );
  }
}
