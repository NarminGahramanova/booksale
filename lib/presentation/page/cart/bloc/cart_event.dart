part of 'cart_bloc.dart';

sealed class CartEvent {}

class AddToCartEvent extends CartEvent {
  final CartItem product;
  AddToCartEvent({required this.product});
}

class RemoveFromCartEvent extends CartEvent {
  final String productId;
  RemoveFromCartEvent({required this.productId});
}
class DecreaseQuantityEvent extends CartEvent {
  final String productId;
  DecreaseQuantityEvent({required this.productId});
}
class ClearCartEvent extends CartEvent {}