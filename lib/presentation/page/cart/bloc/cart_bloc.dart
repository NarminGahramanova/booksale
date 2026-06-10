import 'package:bloc/bloc.dart';

import '../../../../domain/entities/cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<CartItem> _items = [];

  CartBloc() : super(CartInitial()) {
    on<AddToCartEvent>(_onAddToCart);
    on<RemoveFromCartEvent>(_onRemoveFromCart);
    on<ClearCartEvent>(_onClearCart);
    on<DecreaseQuantityEvent>(_onDecreaseQuantity); // ← bura
  }

  void _onAddToCart(AddToCartEvent event, Emitter<CartState> emit) {
    final existingIndex =
    _items.indexWhere((item) => item.book.id == event.product.book.id);
    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(event.product);
    }
    emit(CartUpdated(items: List.from(_items)));
  }

  void _onRemoveFromCart(RemoveFromCartEvent event, Emitter<CartState> emit) {
    _items.removeWhere((item) => item.book.id == event.productId);
    emit(CartUpdated(items: List.from(_items)));
  }

  void _onClearCart(ClearCartEvent event, Emitter<CartState> emit) {
    _items.clear();
    emit(CartUpdated(items: []));
  }

  void _onDecreaseQuantity(DecreaseQuantityEvent event, Emitter<CartState> emit) {
    final index = _items.indexWhere((item) => item.book.id == event.productId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
    }
    emit(CartUpdated(items: List.from(_items)));
  }
}