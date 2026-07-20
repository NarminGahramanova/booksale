import 'package:hive_flutter/hive_flutter.dart';

abstract class CartLocalDatasource {
  Future<void> saveCartItem(Map<String,dynamic>item);
  List<Map<String,dynamic>> getAllCartItems();
  Future<void> removeCartItem(String bookId);
  Future<void> clearCart();
}

class CartLocalDataSourceImpl implements CartLocalDatasource{
  final Box box;

  CartLocalDataSourceImpl(this.box);
@override
  Future<void> saveCartItem(Map<String, dynamic> item) async {
    await box.put(item['book']['id'], item);
  }
@override
  List<Map<String, dynamic>> getAllCartItems() {
    return box.values
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }
@override
  Future<void> removeCartItem(String bookId) async {
    await box.delete(bookId);
  }
@override
  Future<void> clearCart() async {
    await box.clear();
  }
}