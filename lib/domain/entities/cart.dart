import 'book.dart';

class CartItem {
  final Book book;
    int quantity;

  CartItem({required this.book, required this.quantity});

  CartItem copywith({int? quantity}) {
    return CartItem(book: book, quantity: quantity ?? this.quantity);
  }
}

class Cart {
  final List<CartItem> items;

  const Cart({required this.items});
}
