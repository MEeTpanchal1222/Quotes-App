// lib/models/quote.dart
class Quote {
  int? id;
  String quote;
  String author;
  String category;
  bool isFavorite;

  Quote({this.id, required this.quote, required this.author, required this.category, this.isFavorite = false});

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    quote: json['quote'],
    author: json['author'],
    category: json['cate'],
    isFavorite: json['like'] == '1',
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'quote': quote,
    'author': author,
    'category': category,
    'isFavorite': isFavorite ? 1 : 0,
  };

  factory Quote.fromMap(Map<String, dynamic> map) => Quote(
    id: map['id'],
    quote: map['quote'],
    author: map['author'],
    category: map['category'],
    isFavorite: map['isFavorite'] == 1,
  );
}
