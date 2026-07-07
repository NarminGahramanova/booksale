import 'package:dio/dio.dart';

import '../models/book_model.dart';

abstract class BookRemoteDatasource {
  Future<List<BookModel>> getBooks({
    String? search,
    String? categoryId,
    double? minPrice,
    double? maxPrice,
    bool? featured,
    String? sort,
    int page = 1,
    int pageSize = 20,
  });

  Future<List<BookModel>> getFeaturedBooks({int limit = 10});

  Future<BookModel> getBookById(String id);

  Future<BookModel> addBook(BookModel book);

  Future<void> deleteBook(String id);
}

class BookRemoteDatasourceImpl implements BookRemoteDatasource {
  final Dio dio;

  BookRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<BookModel>> getBooks({
    String? search,
    String? categoryId,
    double? minPrice,
    double? maxPrice,
    bool? featured,
    String? sort,
    int page = 1,
    int pageSize = 20,
  }) async {
    final res = await dio.get(
      '/api/books',
      queryParameters: {
        'Search': ?search,
        'CategoryId': ?categoryId,
        'MinPrice': ?minPrice,
        'MaxPrice': ?maxPrice,
        'Featured': ?featured,
        'Sort': ?sort,
        'Page': page,
        'PageSize': pageSize,
      },
    );

    final List items = res.data['items'];
    return items.map((e) => BookModel.fromJson(e)).toList();
  }

  @override
  Future<List<BookModel>> getFeaturedBooks({int limit = 10}) async {
    final res = await dio.get(
      '/api/books/featured',
      queryParameters: {'limit': limit},
    );
    return (res.data as List).map((e) => BookModel.fromJson(e)).toList();
  }

  @override
  Future<BookModel> getBookById(String id) async {
    final res = await dio.get('/api/books/$id');
    return BookModel.fromJson(res.data);
  }

  @override
  Future<BookModel> addBook(BookModel book) async {
    final res = await dio.post('/api/books', data: book.toJson());
    return BookModel.fromJson(res.data);
  }
  @override
  Future<void> deleteBook(String id) async {
    await dio.delete('/api/books/$id');
  }
}
