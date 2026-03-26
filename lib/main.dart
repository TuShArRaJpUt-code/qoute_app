import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/datasources/quote_remote_datasource.dart';

import 'domain/repositories/quote_repository_impl.dart';
import 'domain/usecases/get_random_quote.dart';
import 'presentation/bloc/quote_bloc.dart';
import 'presentation/screens/quote_screen.dart';

void main() {
  final dataSource = QuoteRemoteDataSource();
  final repository = QuoteRepositoryImpl(dataSource);
  final useCase = GetRandomQuote(repository);

  runApp(MyApp(useCase));
}

class MyApp extends StatelessWidget {
  final GetRandomQuote useCase;

  const MyApp(this.useCase, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => QuoteBloc(useCase),
        child: const QuoteScreen(),
      ),
    );
  }
}