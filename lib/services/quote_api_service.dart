// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../modals/quote.dart';

class ApiService {
  final String apiUrl = 'https://sheetdb.io/api/v1/accmtecgjck1x';

  Future<List<Quote>> fetchQuotes() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Quote.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}
