import 'package:qoute_app/domain/entities/quotes.dart';



class QuoteModel extends Quotes {
  const QuoteModel({required super.Content, required super.Author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      Content: json['content'],
      Author: json['author'],
    );
  }
}