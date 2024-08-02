// // controllers/quote_controller.dart
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:pr_7_db_miner/modals/quote.dart';
// import 'dart:convert';
//
// import 'package:pr_7_db_miner/services/database_helper.dart';
//
// class QuoteController extends GetxController {
//   var isLoading = true.obs;
//   var quotes = <Quote>[].obs;
//   var favoriteQuotes = <Quote>[].obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchQuotes();
//     loadFavoriteQuotes();
//   }
//
//   Future<void> fetchQuotes() async {
//     try {
//       isLoading(true);
//       var response = await http.get(Uri.parse('https://sheetdb.io/api/v1/accmtecgjck1x'));
//       if (response.statusCode == 200) {
//         var data = json.decode(response.body);
//         for (var item in data) {
//           quotes.add(Quote.fromMap(item));
//         }
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   Future<void> loadFavoriteQuotes() async {
//     var dbQuotes = await DatabaseHelper().getLikedQuotes();
//     favoriteQuotes.addAll(dbQuotes);
//   }
//
//   void likeQuote(Quote quote) {
//     if (quote.liked) {
//       DatabaseHelper().deleteQuote(quote.id!);
//       favoriteQuotes.remove(quote);
//     } else {
//       DatabaseHelper().insertQuote(quote);
//       favoriteQuotes.add(quote);
//     }
//     quote.liked = !quote.liked;
//     quotes.refresh();
//     favoriteQuotes.refresh();
//   }
// }
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pr_7_db_miner/modals/quote.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/quote.dart';

class QuoteController extends GetxController {
  var quotes = <Quote>[].obs;
  var categories = <String>[].obs;
  var isLoading = true.obs;

  late Database database;

  @override
  void onInit() {
    super.onInit();
    initDatabase();
    fetchQuotes();
  }

  Future<void> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'quotes.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Quotes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            text TEXT,
            author TEXT,
            category TEXT,
            liked INTEGER
          )
        ''');
      },
    );
  }

  Future<void> fetchQuotes() async {
    isLoading(true);

    // Fetch from API
    final response = await http.get(Uri.parse('https://sheetdb.io/api/v1/accmtecgjck1x'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Quote> fetchedQuotes = data.map((item) => Quote.fromJson(item)).toList();

      // Save quotes to the database
      for (var quote in fetchedQuotes) {
        await saveQuote(quote);
      }

      // Load quotes from the database
      await loadQuotesFromDatabase();
    } else {
      throw Exception('Failed to load quotes from API');
    }

    isLoading(false);
  }

  Future<void> loadQuotesFromDatabase() async {
    final List<Map<String, dynamic>> maps = await database.query('Quotes');

    quotes.value = List.generate(maps.length, (i) {
      return Quote(
        text: maps[i]['text'],
        author: maps[i]['author'],
        category: maps[i]['category'],
        liked: maps[i]['liked'] == 1,
      );
    });

    // Populate categories
    categories.value = quotes.map((quote) => quote.category).toSet().toList();
  }

  Future<void> likeQuote(Quote quote) async {
    quote.liked = !quote.liked;
    quotes.refresh();

    await database.update(
      'Quotes',
      {'liked': quote.liked ? 1 : 0},
      where: 'text = ?',
      whereArgs: [quote.text],
    );
  }

  Future<void> saveQuote(Quote quote) async {
    await database.insert(
      'Quotes',
      {
        'text': quote.text,
        'author': quote.author,
        'category': quote.category,
        'liked': quote.liked ? 1 : 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
