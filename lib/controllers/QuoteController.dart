// lib/controllers/quote_controller.dart
import 'package:get/get.dart';
import 'package:pr_7_db_miner/modals/quote.dart';
import 'package:pr_7_db_miner/services/quote_api_service.dart';
import '../services/database_helper.dart';

class QuoteController extends GetxController {
  var quotes = <Quote>[].obs;
  var filteredQuotes = <Quote>[].obs;
  var isLoading = true.obs;
  var selectedCategory = 'All'.obs;
  var categories = <String>[].obs;
  var authors = <String>[].obs;

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
      // Fetch quotes from database
      var dbQuotes = await databaseHelper.getQuotes();
      quotes.assignAll(dbQuotes);

      // Fetch quotes from API
      var apiQuotes = await apiService.fetchQuotes();

      // Insert API quotes into the database and assign to quotes list
      for (var quote in apiQuotes) {
        await databaseHelper.insert(quote);
      }

      // Fetch updated quotes from the database
      var allQuotes = await databaseHelper.getQuotes();
      quotes.assignAll(allQuotes);
      filterQuotes(selectedCategory.value);

      // Extract unique categories and authors
      extractUniqueCategoriesAndAuthors();
    } catch (e) {
      // Handle errors appropriately
      print("Error fetching quotes: $e");
    } finally {
      isLoading(false);
    }
  }

  void filterQuotes(String category) {
    if (category == 'All') {
      filteredQuotes.assignAll(quotes);
    } else {
      filteredQuotes.assignAll(quotes.where((quote) => quote.category == category).toList());
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

  void extractUniqueCategoriesAndAuthors() {
    categories.assignAll(quotes.map((quote) => quote.category).toSet().toList());
    authors.assignAll(quotes.map((quote) => quote.author).toSet().toList());
  }
}
