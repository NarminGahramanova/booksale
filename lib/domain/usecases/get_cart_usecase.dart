

import '../entities/cart.dart';
import '../repositories/cart_repo.dart';

class GetCartUsecase {
  final CartRepo  repository;

  GetCartUsecase({required this.repository});
   Future<Cart>call(){
     return repository.getCart();

   }
}