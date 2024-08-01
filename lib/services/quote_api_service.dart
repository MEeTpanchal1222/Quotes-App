// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pr_7_db_miner/modals/quote.dart';

class ApiService {
  final String apiUrl = 'https://sheetdb.io/api/v1/accmtecgjck1x';

  Future<List<Quote>> fetchQuotes() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Quote.fromMap(data)).toList();
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}
