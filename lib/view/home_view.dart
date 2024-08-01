// lib/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/controllers/QuoteController.dart';
import 'package:pr_7_db_miner/view/add_quotes_view.dart';
import 'package:pr_7_db_miner/view/quotes_detail_view.dart';
import '../controllers/theme_controller.dart';
import 'favorites_view.dart';

class HomeView extends StatelessWidget {
  final QuoteController quoteController = Get.put(QuoteController());
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
        actions: [
          IconButton(
            icon: Icon(themeController.isDarkMode.value ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              themeController.toggleTheme();
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(AddQuoteView());
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Get.to(FavoritesView());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return DropdownButtonFormField<String>(
                value: quoteController.selectedCategory.value,
                items: quoteController.categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (newValue) {
                  quoteController.selectedCategory.value = newValue!;
                  quoteController.filterQuotes(newValue);
                },
                decoration: InputDecoration(labelText: 'ALL'),
              );
            }),
          ),
          Expanded(
            child: Obx(() {
              if (quoteController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: quoteController.filteredQuotes.length,
                itemBuilder: (context, index) {
                  final quote = quoteController.filteredQuotes[index];
                  return ListTile(
                    title: Text(quote.quote),
                    subtitle: Text('- ${quote.author}'),
                    onTap: () {
                      Get.to(QuoteDetailView(quote: quote));
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            quote.isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: quote.isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            quoteController.toggleFavoriteStatus(quote);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            quoteController.deleteQuote(quote.id!);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
