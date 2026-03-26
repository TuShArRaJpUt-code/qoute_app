import 'package:qoute_app/domain/entities/quotes.dart';


import '../repositories/quote_repository.dart';

class GetRandomQuote {
  final QuoteRepository repository;

  GetRandomQuote(this.repository);

  Future<Quotes> call() async {
    return await repository.getRandomQuote();
  }
}