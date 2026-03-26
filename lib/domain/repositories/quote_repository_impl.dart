import 'package:qoute_app/domain/entities/quotes.dart';

import '../../data/datasources/quote_remote_datasource.dart';

import '../../domain/repositories/quote_repository.dart';


class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteRemoteDataSource remoteDataSource;

  QuoteRepositoryImpl(this.remoteDataSource);

  @override
  Future<Quotes> getRandomQuote() async {
    return await remoteDataSource.getRandomQuote();
  }
}