import 'package:equatable/equatable.dart';

class Quotes  extends Equatable{
  final String Content;
  final String Author;
   const Quotes({required this.Author , required this.Content});

   @override
  List<Object?> get props => [Content, Author];

}