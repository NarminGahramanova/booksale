import 'package:booksale/core/utils/result.dart';
import 'package:booksale/domain/entities/book.dart';

abstract class BookRepo {
  Future<Result<List<Book>>> getAllBooks();
  Future<Result<Book?>>getBookById(String id);
  Future<Result<void>>addBook(Book book);
  Future<Result<void>>deleteBook(String id);
}