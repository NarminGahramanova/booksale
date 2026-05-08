

import '../repositories/cart_repo.dart';

class GetCartUsecase {
  final CartRepo  repository;

  GetCartUsecase({required this.repository});
   Future<void>call(){
     return repository.getCart();

   }
}