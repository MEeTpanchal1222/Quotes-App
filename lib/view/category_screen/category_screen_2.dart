import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr_7_db_miner/controllers/QuoteController.dart';

class CategoryScreen2 extends StatelessWidget {
  final String category;
  const CategoryScreen2({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final QuotesController quotesController = Get.put(QuotesController());

    // Filter quotes based on the selected category
    final filteredQuotes = quotesController.quotes
        .where((quote) => quote.cate == category)
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent.shade100,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.multiply),
        ),
        title: Text(
          '$category',
          style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.greenAccent.shade100,
      body: ListView.builder(
        itemCount: filteredQuotes.length,
        itemBuilder: (context, index) => Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.yellow.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    filteredQuotes[index].text,
                    style: TextStyle(color: Colors.green.shade900, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
