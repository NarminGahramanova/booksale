import 'package:booksale/data/datasources/cart_local_datasource.dart';
import 'package:booksale/data/models/cart_model.dart';
import 'package:booksale/domain/entities/cart.dart';
import 'package:booksale/domain/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartLocalDataSource dataSource;

  CartRepoImpl(this.dataSource);

  @override
  Future<Cart> getCart() async {
    final maps = dataSource.getAllCartItems();
    final items = maps.map((e) => CartItemModel.fromJson(e)).toList();
    return Cart(items: items);
  }

  @override
  Future<void> addToCart(CartItem item) async {
    final model = CartItemModel.fromEntity(item);
    await dataSource.saveCartItem(model.toJson());
  }

  @override
  Future<void> removeFromCart(String bookId) async {
    await dataSource.removeCartItem(bookId);
  }

  @override
  Future<void> clearCart() async {
    await dataSource.clearCart();
  }
}

