// // models/quote.dart
// class Quote {
//   int? id;
//   String quote;
//   String author;
//   String category;
//   bool liked;
//
//   Quote({
//     this.id,
//     required this.quote,
//     required this.author,
//     required this.category,
//     this.liked = false,
//   });
//
//   factory Quote.fromMap(Map<String, dynamic> json) => Quote(
//     id: json["id"],
//     quote: json["quote"],
//     author: json["author"],
//     category: json["cate"],
//     liked: json["like"] == "1",
//   );
//
//   Map<String, dynamic> toMap() => {
//     "id": id,
//     "quote": quote,
//     "author": author,
//     "category": category,
//     "liked": liked ? 1 : 0,
//   };
// }


class Quote {
  int? id;
  String text;
  String author;
  String category;
  bool liked;

  Quote({
    this.id,
    required this.text,
    required this.author,
    required this.category,
    this.liked = false, required quote,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      text: json['quote'],
      author: json['author'],
      category: json['cate'],
      liked: json['like'] == '1',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'author': author,
      'category': category,
      'liked': liked ? '1' : '0',
    };
  }
}
