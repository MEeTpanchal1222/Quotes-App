import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/modals/quote.dart';
import 'package:pr_7_db_miner/view/quotes_detail_view.dart';


class QuoteCard extends StatelessWidget {
  final Quote quote;

  QuoteCard({required this.quote});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(QuoteDetailView(quote: quote));
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                quote.text,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text('- ${quote.author}'),
            ],
          ),
        ),
      ),
    );
  }
}
