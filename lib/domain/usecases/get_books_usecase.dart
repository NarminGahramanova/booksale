
import '../entities/book.dart';
import '../repositories/book_repo.dart';

class GetBooksUsecase {
  final BookRepo repository;

  GetBooksUsecase({required this.repository});
  Future<List<Book>> call() {
    return repository.getAllBooks();
  }
}