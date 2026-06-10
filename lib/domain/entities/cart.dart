import 'book.dart';

class CartItem {

  final Book book;
  int quantity;


  CartItem({required this.book,required this.quantity,e});
}

class Cart {
  final List<CartItem> items;

  const Cart({
  required this.items});
}