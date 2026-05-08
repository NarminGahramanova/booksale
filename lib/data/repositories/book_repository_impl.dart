import 'package:booksale/data/datasources/book_local_datasource.dart';
import 'package:booksale/data/models/book_model.dart';
import 'package:booksale/domain/entities/book.dart';
import 'package:booksale/domain/repositories/book_repo.dart';

class BookRepoImpl implements BookRepo {
  final BookLocalDataSource dataSource;

  BookRepoImpl(this.dataSource);

  @override
  Future<List<Book>> getAllBooks() async {
    final maps = dataSource.getAllBooks();
    return maps.map((e) => BookModel.fromJson(e).toEntity()).toList();
  }

  @override
  Future<Book?> getBookById(String id) async {
    final map = await dataSource.getBook(id);
    if (map == null) return null;
    return BookModel.fromJson(map).toEntity();
  }

  @override
  Future<void> addBook(Book book) async {
    final model = BookModel.fromEntity(book);
    await dataSource.saveBook(model.toJson());
  }

  @override
  Future<void> deleteBook(String id) async {
    await dataSource.deleteBook(id);
  }
}