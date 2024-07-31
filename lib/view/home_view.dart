import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/view/quotes_detail_view.dart';
import '../controllers/QuoteController.dart';
import 'add_quotes_view.dart';


class HomeView extends StatelessWidget {
  final QuoteController quoteController = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(AddQuoteView());
            },
          ),
        ],
      ),
      body: Obx(() {
        if (quoteController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: quoteController.quotes.length,
          itemBuilder: (context, index) {
            final quote = quoteController.quotes[index];
            return ListTile(
              title: Text(quote.quote),
              subtitle: Text('- ${quote.author}'),
              onTap: () {
                Get.to(QuoteDetailView(quote: quote));
              },
              trailing: IconButton(
                icon: Icon(
                  quote.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: quote.isFavorite ? Colors.red : null,
                ),
                onPressed: () {
                  quoteController.toggleFavoriteStatus(quote);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
