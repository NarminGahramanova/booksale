import 'package:booksale/domain/entities/book.dart';

class BookModel {
  final String title;
  final String id;
  final String author;
  final String category;
  final double price;
  final String condition;
  final String imageUrl;
  final String description;
  final String publisher;
  final String year;

  BookModel({
    required this.title,
    required this.id,
    required this.author,
    required this.category,
    required this.price,
    required this.condition,
    required this.imageUrl,
    required this.description,
    required this.publisher,
    required this.year,
  });

  Book toEntity() {
    return Book(
      id: id,
      title: title,
      author: author,
      category: category,
      condition: condition,
      imageUrl: imageUrl,
      description: description,
      publisher: publisher,
      year: year,
      price: price,
    );
  }

  factory BookModel.fromEntity(Book book) {
    return BookModel(
      id: book.id,
      title: book.title,
      author: book.author,
      category: book.category,
      condition: book.condition,
      imageUrl: book.imageUrl,
      description: book.description,
      publisher: book.publisher,
      year: book.year,
      price: book.price,
    );
  }


  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      category: json['category'],
      condition: json['condition'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      publisher: json['publisher'],
      year: json['year'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'category': category,
      'condition': condition,
      'imageUrl': imageUrl,
      'description': description,
      'publisher': publisher,
      'year': year,
      'price': price,
    };
  }
}