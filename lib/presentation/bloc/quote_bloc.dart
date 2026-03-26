import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoute_app/presentation/bloc/qoute_event.dart';

import 'quote_state.dart';
import '../../domain/usecases/get_random_quote.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final GetRandomQuote getRandomQuote;

  QuoteBloc(this.getRandomQuote) : super(QuoteInitial()) {
    on<GetQuoteEvent>((event, emit) async {
      emit(QuoteLoading());
      try {
        final quote = await getRandomQuote();
        emit(QuoteLoaded(quote));
      } catch (e) {
        emit(QuoteError('Failed to fetch quote'));
      }
    });
  }
}