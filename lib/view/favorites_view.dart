import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pr_7_db_miner/controllers/QuoteController.dart';
import 'package:pr_7_db_miner/view/widgets/quote_card.dart';

class LikedQuotesView extends StatelessWidget {
  final QuoteController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Quotes'),
      ),
      body: Obx(() {
        var likedQuotes = controller.quotes.where((quote) => quote.liked).toList();
        return ListView.builder(
          itemCount: likedQuotes.length,
          itemBuilder: (context, index) {
            return QuoteCard(quote: likedQuotes[index]);
          },
        );
      }),
    );
  }
}
