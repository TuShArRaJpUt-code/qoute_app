import 'package:equatable/equatable.dart';
import 'package:qoute_app/domain/entities/quotes.dart';


abstract class QuoteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuoteInitial extends QuoteState {}

class QuoteLoading extends QuoteState {}

class QuoteLoaded extends QuoteState {
  final Quotes quote;

  QuoteLoaded(this.quote);

  @override
  List<Object?> get props => [quote];
}

class QuoteError extends QuoteState {
  final String message;

  QuoteError(this.message);

  @override
  List<Object?> get props => [message];
}