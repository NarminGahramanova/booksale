

import 'package:booksale/domain/entities/cart.dart';

import '../repositories/cart_repo.dart';

class AddToCartUsecase {
  final CartRepo repository;

  AddToCartUsecase({required this.repository});
   Future<void>call(CartItem item){
     return repository.addToCart(item);
   }
}