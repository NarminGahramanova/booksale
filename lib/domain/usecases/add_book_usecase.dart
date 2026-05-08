import 'package:booksale/domain/repositories/book_repo.dart';

import '../entities/book.dart';

class AddBookUsecase {
   final BookRepo repository;

  AddBookUsecase({required this.repository});
  Future<void>call( Book book){
    return repository.addBook( book);

  }

}