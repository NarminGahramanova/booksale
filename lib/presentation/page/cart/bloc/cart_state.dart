part of 'cart_bloc.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartUpdated extends CartState {
  final List<CartItem> items;
  CartUpdated({required this.items});

  // double get totalPrice =>
  //     items.fold(0, (sum, item) => sum + item.book.price * item.quantity);

  int get itemCount => items.length;
}