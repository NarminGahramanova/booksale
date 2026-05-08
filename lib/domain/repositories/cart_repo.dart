import 'package:booksale/domain/entities/cart.dart';

abstract class CartRepo {
   Future <Cart>getCart();
   Future<void>addToCart(CartItem item);
   Future<void>removeFromCart(String bookId);
   Future<void>clearCart();
}