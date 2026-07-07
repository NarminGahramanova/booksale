import 'package:booksale/core/utils/result.dart';
import 'package:booksale/domain/entities/cart.dart';

abstract class CartRepo {
   Future <Result<Cart>>getCart();
   Future<Result<void>>addToCart(CartItem item);
   Future<Result<void>>removeFromCart(String bookId);
   Future<Result<void>>clearCart();
}