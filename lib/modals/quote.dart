class Quote {
  int? id;
  String text;
  String author;
  String cate;
  String liked;

  Quote({this.id, required this.text, required this.author,required this.liked,required this.cate });

  Map<String, dynamic> toMap() {
    return {
      'cate':cate,
      'id': id,
      'text': text,
      'author': author,
      'liked': liked ,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['id'],
      cate: map['cate'],
      text: map['quote'],
      author: map['author'],
      liked: map['like'],
    );
  }
}
