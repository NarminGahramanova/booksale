
import '../repositories/cart_repo.dart';

class ClearCartUsecase {

  final CartRepo  repository;

  ClearCartUsecase({required this.repository});

  Future<void>call(){
    return repository.clearCart();
  }
}