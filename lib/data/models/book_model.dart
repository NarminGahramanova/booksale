import 'package:booksale/domain/entities/book.dart';

class BookModel {
  final String id;
  final String title;
  final String author;
  final String description;
  final double price;
  final String currency;
  final String imageUrl;
  final String category;
  final String categoryName;
  final int stock;
  final String isbn;
  final String publisher;
  final int pageCount;
  final String language;
  final int publishedYear;
  final double rating;
  final int reviewCount;
  final bool isFavorited;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.price,
    required this.currency,
    required this.imageUrl,
    required this.category,
    required this.categoryName,
    required this.stock,
    required this.isbn,
    required this.publisher,
    required this.pageCount,
    required this.language,
    required this.publishedYear,
    required this.rating,
    required this.reviewCount,
    required this.isFavorited,
  });

  Book toEntity() {
    return Book(
      id: id,
      title: title,
      author: author,
      description: description,
      price: price,
      currency: currency,
      imageUrl: imageUrl,
      category: category,
      categoryName: categoryName,
      stock: stock,
      isbn: isbn,
      publisher: publisher,
      pageCount: pageCount,
      language: language,
      publishedYear: publishedYear,
      rating: rating,
      reviewCount: reviewCount,
      isFavorited: isFavorited,
    );
  }

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