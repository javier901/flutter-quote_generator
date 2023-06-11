import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  final int? id;
  final String text;
  final String author;
  final String textAlign;
  final int backgroundColor;
  final double fontSize;
  final String fontWeight;
  final double wordSpacing;
  final double letterSpacing;
  final int isFavorite;

  const Quote({
    this.id,
    required this.text,
    required this.author,
    required this.textAlign,
    required this.backgroundColor,
    required this.fontSize,
    required this.fontWeight,
    required this.wordSpacing,
    required this.letterSpacing,
    this.isFavorite = 0,
  });

  @override
  List<Object> get props {
    return [
      text,
      author,
      textAlign,
      backgroundColor,
      fontSize,
      fontWeight,
      wordSpacing,
      letterSpacing,
      isFavorite,
    ];
  }
}