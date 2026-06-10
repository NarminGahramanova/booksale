import 'package:booksale/domain/entities/book.dart';
import 'package:booksale/domain/repositories/book_repo.dart';
import '../datasources/book_remote_datasource.dart';

class BookRepositoryImpl implements BookRepo {
  final _datasource = BookRemoteDatasource();

  @override
  Future<List<Book>> getAllBooks() async {
    final models = await _datasource.getBooks();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<Book?> getBookById(String id) async {
    final model = await _datasource.getBookById(id);
    return model.toEntity();
  }

  @override
  Future<void> addBook(Book book) async {
    // TODO: API hazır olanda
  }

  @override
  Future<void> deleteBook(String id) async {
    // TODO: API hazır olanda
  }
}