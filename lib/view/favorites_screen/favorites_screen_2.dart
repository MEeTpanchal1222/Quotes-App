import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pr_7_db_miner/controllers/QuoteController.dart';
import 'package:share_plus/share_plus.dart';

class LikeScreen extends StatefulWidget {
  final String category;
  const LikeScreen({super.key, required this.category});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    final QuotesController quotesController = Get.put(QuotesController());

    // Filter quotes based on the selected category
    final filteredQuotes = quotesController.quotes
        .where((quote) => quote.cate == widget.category  && quote.liked == '1')
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
          'Like Quotes',
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        filteredQuotes[index].text,
                        style: TextStyle(color: Colors.green.shade900, fontSize: 25),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                           "~ ${filteredQuotes[index].author}",
                          style: TextStyle(color: Colors.green.shade900, fontSize: 20),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Share.share('${quotesController.quotes[index].text} - ${quotesController.quotes[index].author}');
                            },
                            icon: Icon(
                              CupertinoIcons.share,
                              color: Colors.green.shade900,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          IconButton(
                            icon: Icon(filteredQuotes[index].liked == "1" ? Icons.favorite : Icons.favorite_border,
                              color: filteredQuotes[index].liked == "1" ? Colors.red : Colors.green.shade900,
                              size: 30,),
                            onPressed: () {
                              setState(() {
                                quotesController.likeQuote(filteredQuotes[index]);
                              });
                            },
                          ),
                          SizedBox(
                            width: 30,
                          ),

                          IconButton(
                              icon: Icon(Icons.copy_rounded,color: Colors.green.shade900,size: 30,),
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: '${quotesController.quotes[index].text} - ${quotesController.quotes[index].author}'));
                                Get.snackbar(
                                  backgroundColor: Colors.yellow.shade100,
                                  'Copied',
                                  'Quote copied to clipboard',
                                  snackPosition: SnackPosition.BOTTOM,
                                );}),
                        ],
                      ),
                    ],
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
