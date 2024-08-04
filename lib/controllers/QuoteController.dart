import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pr_7_db_miner/modals/quote.dart';
import 'package:pr_7_db_miner/services/database_helper.dart';
import 'dart:convert';




class QuotesController extends GetxController {
  RxList<Quote> quotes = <Quote>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;
  RxList<Quote> favoriteQuotes = <Quote>[].obs;
  Set<String> categories = {};
  var love=false.obs;


  @override
  void onInit() {
    super.onInit();
    fetchQuotes();
    loadFavoriteQuotes();
  }
  void fetchQuotes() async {
    isLoading(true);
    try {
      final response = await http.get(Uri.parse('https://sheetdb.io/api/v1/accmtecgjck1x'));
      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);

        for (var item in body) {
          if (item['cate'] != null) {
            categories.add(item['cate']);
          }
        }
        print('Unique Categories: ${categories.toList()}');
        print('Total Categories: ${categories.length}');
        quotes.assignAll(body.map((dynamic item) => Quote.fromMap(item)).toList());
      } else {
        errorMessage('Failed to load quotes');
      }
    } catch (e) {
      errorMessage('Failed to load quotes: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> loadFavoriteQuotes() async {
    var dbQuotes = await DatabaseHelper.instance.getLikedQuotes();
    favoriteQuotes.addAll(dbQuotes.map((item) => Quote.fromMap(item)).toList());
  }


  void likeQuote(Quote quote) async {
    if (quote.liked == "1") {
      await DatabaseHelper.instance.deleteQuote(quote.text);
      DatabaseHelper.instance.getLikedQuotes();
      quote.liked = "0";
      favoriteQuotes.remove(quote);
    } else {
      final db = await DatabaseHelper.instance.database;
      await DatabaseHelper.instance.insertQuote(db,quote.cate,quote.text,quote.author,quote.liked);
      quote.liked = "1";
      favoriteQuotes.add(quote);
    }
    quotes.refresh();
    favoriteQuotes.refresh();
    update();
  }

}



