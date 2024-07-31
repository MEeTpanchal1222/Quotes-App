// lib/controllers/quote_controller.dart
import 'package:get/get.dart';
import '../modals/quote.dart';
import '../services/database_helper.dart';
import '../services/quote_api_service.dart';

class QuoteController extends GetxController {
  var quotes = <Quote>[].obs;
  var isLoading = true.obs;

  final DatabaseHelper databaseHelper = DatabaseHelper.instance;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  void fetchQuotes() async {
    isLoading(true);
    try {
      var dbQuotes = await databaseHelper.getQuotes();
      var apiQuotes = await apiService.fetchQuotes();

      // Insert API quotes into the database
      for (var quote in apiQuotes) {
        await databaseHelper.insert(quote);
      }

      // Fetch quotes from the database again
      var allQuotes = await databaseHelper.getQuotes();
      quotes.assignAll(allQuotes);
    } finally {
      isLoading(false);
    }
  }

  void toggleFavoriteStatus(Quote quote) async {
    quote.isFavorite = !quote.isFavorite;
    await databaseHelper.update(quote);
    fetchQuotes();
  }

  void addQuote(Quote quote) async {
    await databaseHelper.insert(quote);
    fetchQuotes();
  }

  void deleteQuote(int id) async {
    await databaseHelper.delete(id);
    fetchQuotes();
  }
}
