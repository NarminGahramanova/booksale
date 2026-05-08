import 'package:booksale/domain/repositories/book_repo.dart';

class DeleteBookUsecase {
  final BookRepo repository;

  DeleteBookUsecase({required this.repository});
   Future<void>call(String id){
     return repository.deleteBook(id);
   }

}