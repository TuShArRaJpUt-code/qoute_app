import 'package:qoute_app/domain/entities/quotes.dart';



abstract class QuoteRepository {
  Future<Quotes> getRandomQuote();
}
