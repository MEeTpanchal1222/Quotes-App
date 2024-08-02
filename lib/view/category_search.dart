import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/controllers/QuoteController.dart';
import 'package:pr_7_db_miner/view/widgets/quote_card.dart';


class CategoryView extends StatelessWidget {
  final String category;
  final QuoteController controller = Get.find();

  CategoryView({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Obx(() {
        var categoryQuotes = controller.quotes.where((quote) => quote.category == category).toList();
        return ListView.builder(
          itemCount: categoryQuotes.length,
          itemBuilder: (context, index) {
            return QuoteCard(quote: categoryQuotes[index]);
          },
        );
      }),
    );
  }
}
