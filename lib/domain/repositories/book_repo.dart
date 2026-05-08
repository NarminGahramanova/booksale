import 'package:booksale/domain/entities/book.dart';

abstract class BookRepo {
  Future<List<Book>>getAllBooks();
  Future<Book?>getBookById(String id);
  Future<void>addBook(Book book);
  Future<void>deleteBook(String id);
}