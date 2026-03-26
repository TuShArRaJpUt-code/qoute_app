import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qoute_app/data/models/qoute_models.dart';


class QuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote() async {
    print("API FUNCTION CALLED");

    try {
      final response = await http
          .get(Uri.parse('http://api.quotable.io/random'))
          .timeout(const Duration(seconds: 5));

      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");

      if (response.statusCode == 200) {
        return QuoteModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e, stacktrace) {
      print("ERROR TYPE: ${e.runtimeType}");
      print("ERROR MESSAGE: $e");
      print("STACKTRACE: $stacktrace");
      throw Exception('Failed to load quote');
    }
  }
}