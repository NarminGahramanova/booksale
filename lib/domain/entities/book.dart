class Book {
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

  Book({
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
}