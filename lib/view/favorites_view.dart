// lib/views/favorites_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/controllers/QuoteController.dart';
import 'package:pr_7_db_miner/view/quotes_detail_view.dart';

class FavoritesView extends StatelessWidget {
  final QuoteController quoteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Obx(() {
        final favoriteQuotes = quoteController.quotes.where((quote) => quote.isFavorite).toList();
        if (favoriteQuotes.isEmpty) {
          return Center(child: Text('No favorite quotes yet'));
        }
        return ListView.builder(
          itemCount: favoriteQuotes.length,
          itemBuilder: (context, index) {
            final quote = favoriteQuotes[index];
            return ListTile(
              title: Text(quote.quote),
              subtitle: Text('- ${quote.author}'),
              onTap: () {
                Get.to(QuoteDetailView(quote: quote));
              },
            );
          },
        );
      }),
    );
  }
}
