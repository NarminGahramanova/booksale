import 'package:booksale/domain/entities/cart.dart';
import 'book_model.dart';

class CartItemModel {
  final BookModel book;
  final int quantity;

  CartItemModel({
    required this.book,
    required this.quantity,
  });

  CartItem toEntity() {
    return CartItem(
      book: book.toEntity(),
      quantity: quantity,
    );
  }

  factory CartItemModel.fromEntity(CartItem item) {
    return CartItemModel(
      book: BookModel.fromEntity(item.book),
      quantity: item.quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'book': book.toJson(),
      'quantity': quantity,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      book: BookModel.fromJson(json['book']),
      quantity: json['quantity'],
    );
  }
}

class CartModel {
  final List<CartItemModel> items;

  CartModel({required this.items});

  Cart toEntity() {
    return Cart(
      items: items.map((e) => e.toEntity()).toList(),
    );
  }

  factory CartModel.fromEntity(Cart cart) {
    return CartModel(
      items: cart.items.map((e) => CartItemModel.fromEntity(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => e.toJson()).toList(),
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: (json['items'] as List)
          .map((e) => CartItemModel.fromJson(e))
          .toList(),
    );
  }
}