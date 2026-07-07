import '../../core/dio/api_client.dart';
import '../models/book_model.dart';

class BookRemoteDatasource {
  final _dio = ApiClient().dio;

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
    final res = await _dio.get(
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

  Future<List<BookModel>> getFeaturedBooks({int limit = 10}) async {
    final res = await _dio.get(
      '/api/books/featured',
      queryParameters: {'limit': limit},
    );
    return (res.data as List).map((e) => BookModel.fromJson(e)).toList();
  }

  Future<BookModel> getBookById(String id) async {
    final res = await _dio.get('/api/books/$id');
    return BookModel.fromJson(res.data);
  }
  Future<BookModel> addBook(BookModel book) async {
    final res = await _dio.post('/api/books', data: book.toJson());
    return BookModel.fromJson(res.data);
  }

  Future<void> deleteBook(String id) async {
    await _dio.delete('/api/books/$id');
  }
}
