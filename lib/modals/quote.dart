// lib/models/quote.dart
class Quote {
  int? id;
  String quote;
  String author;
  String category;
  bool isFavorite;

  Quote({
    this.id,
    required this.quote,
    required this.author,
    required this.category,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quote': quote,
      'author': author,
      'category': category,
      'isFavorite': isFavorite ? 1 : 0,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['id'],
      quote: map['quote'],
      author: map['author'],
      category: map['category'],
      isFavorite: map['isFavorite'] == 1,
    );
  }

  Quote copy({int? id}) => Quote(
    id: id ?? this.id,
    quote: this.quote,
    author: this.author,
    category: this.category,
    isFavorite: this.isFavorite,
  );
}
