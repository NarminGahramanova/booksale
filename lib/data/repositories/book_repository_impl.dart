import 'package:booksale/core/error/failures.dart';
import 'package:booksale/core/utils/result.dart';
import 'package:booksale/domain/entities/book.dart';
import 'package:booksale/domain/repositories/book_repo.dart';
import '../datasources/book_remote_datasource.dart';
import '../models/book_model.dart';

class BookRepositoryImpl implements BookRepo {
  final _datasource = BookRemoteDatasource();

  @override
  Future<Result<List<Book>>> getAllBooks() async {
  try{
    final models = await _datasource.getBooks();
    return  Success(models);
  }catch(e){
    return Error(CacheFailure());
  }
  }

  @override
  Future<Result<Book?>>getBookById(String id) async {

    try{
      final model = await _datasource.getBookById(id);
      return  Success(model);
    }catch(e){
      return Error(CacheFailure());
    }
  }


  @override
  Future<Result<void>> addBook(Book book) async {
    try {
      final model = book is BookModel ? book : BookModel.fromEntity(book);
      await _datasource.addBook(model);
      return const Success(null);
    } catch (e) {
      return Error(CacheFailure());
    }
  }

  @override
  Future<Result<void>> deleteBook(String id) async {
    try {
      await _datasource.deleteBook(id);
      return const Success(null);
    } catch (e) {
      return Error(CacheFailure());
    }
  }

}