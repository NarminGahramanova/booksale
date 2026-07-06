import 'package:booksale/domain/entities/cart.dart';
import 'book_model.dart';

class CartItemModel extends CartItem {
  CartItemModel({
    required BookModel super.book,
    required super.quantity,
  });

  factory CartItemModel.fromEntity(CartItem item) {
    return CartItemModel(
      book: BookModel.fromEntity(item.book),
      quantity: item.quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'book': (book as BookModel).toJson(),
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

class CartModel extends Cart {
  const CartModel({required super.items});

  factory CartModel.fromEntity(Cart cart) {
    return CartModel(
      items: cart.items.map((e) => CartItemModel.fromEntity(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((e) => (e as CartItemModel).toJson()).toList(),
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