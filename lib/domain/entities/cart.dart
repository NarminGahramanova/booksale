import 'book.dart';

class CartItem {

  final Book book;
  final int quantity;

  CartItem({required this.book,required this.quantity});
}

class Cart {
  final List<CartItem> items;

  const Cart({
  required this.items});
}