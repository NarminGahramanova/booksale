import 'package:booksale/domain/entities/book.dart';

class BookModel extends Book {
  const BookModel({
    required super.id,
    required super.title,
    required super.author,
    required super.description,
    required super.price,
    required super.currency,
    required super.imageUrl,
    required super.category,
    required super.categoryName,
    required super.stock,
    required super.isbn,
    required super.publisher,
    required super.pageCount,
    required super.language,
    required super.publishedYear,
    required super.rating,
    required super.reviewCount,
    required super.isFavorited,
  });

  factory BookModel.fromEntity(Book book) {
    return BookModel(
      id: book.id,
      title: book.title,
      author: book.author,
      description: book.description,
      price: book.price,
      currency: book.currency,
      imageUrl: book.imageUrl,
      category: book.category,
      categoryName: book.categoryName,
      stock: book.stock,
      isbn: book.isbn,
      publisher: book.publisher,
      pageCount: book.pageCount,
      language: book.language,
      publishedYear: book.publishedYear,
      rating: book.rating,
      reviewCount: book.reviewCount,
      isFavorited: book.isFavorited,
    );
  }

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      currency: json['currency'] ?? '',
      imageUrl: json['coverImageUrl'] ?? '',
      category: json['categoryId'] ?? '',
      categoryName: json['categoryName'] ?? '',
      stock: json['stock'] ?? 0,
      isbn: json['isbn'] ?? '',
      publisher: json['publisher'] ?? '',
      pageCount: json['pageCount'] ?? 0,
      language: json['language'] ?? '',
      publishedYear: json['publishedYear'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      isFavorited: json['isFavorited'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'price': price,
      'currency': currency,
      'coverImageUrl': imageUrl,
      'categoryId': category,
      'categoryName': categoryName,
      'stock': stock,
      'isbn': isbn,
      'publisher': publisher,
      'pageCount': pageCount,
      'language': language,
      'publishedYear': publishedYear,
      'rating': rating,
      'reviewCount': reviewCount,
      'isFavorited': isFavorited,
    };
  }
}