import 'package:booksale/core/utils/result.dart';
import 'package:booksale/data/datasources/cart_local_datasource.dart';
import 'package:booksale/data/models/cart_model.dart';
import 'package:booksale/domain/entities/cart.dart';
import 'package:booksale/domain/repositories/cart_repo.dart';

import '../../core/error/failures.dart';

class CartRepoImpl implements CartRepo {
  final CartLocalDataSource dataSource;

  CartRepoImpl(this.dataSource);

  @override
  Future<Result<Cart>> getCart() async {
    try{
      final maps = dataSource.getAllCartItems();
      final items = maps.map((e) => CartItemModel.fromJson(e)).toList();
      return Success(Cart(items: items));

    }catch(e){
      return Error(CacheFailure());
    }
    }

  @override
  Future<Result<void>> addToCart(CartItem item) async {
   try{
     final model = CartItemModel.fromEntity(item);
     await dataSource.saveCartItem(model.toJson());
     return const Success(null);
   }catch(e){
     return Error(CacheFailure());
   }
  }

  @override
  Future<Result<void>> removeFromCart(String bookId) async {
   try{
     await dataSource.removeCartItem(bookId);
     return const Success(null);
   }catch(e){
     return Error(CacheFailure());
   }
  }

  @override
  Future<Result<void>> clearCart() async {
   try{
     await dataSource.clearCart();
     return const Success(null);
   }catch(e){
     return Error(CacheFailure());
   }
  }
}

