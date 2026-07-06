import 'package:equatable/equatable.dart';

import 'book.dart';

class CartItem extends Equatable {
  final Book book;
  int quantity;

   CartItem({required this.book, required this.quantity});

  CartItem copywith({int? quantity}) {
    return CartItem(book: book, quantity: quantity ?? this.quantity);
  }

  @override
  List<Object?> get props => [book, quantity];
}

class Cart extends Equatable{
  final List<CartItem> items;

  const Cart({required this.items});

  @override
  List<Object?> get props => [
    items
  ];
}
