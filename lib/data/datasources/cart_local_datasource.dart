import 'package:hive_flutter/hive_flutter.dart';

class CartLocalDataSource {
  final Box box;

  CartLocalDataSource(this.box);

  Future<void> saveCartItem(Map<String, dynamic> item) async {
    await box.put(item['book']['id'], item);
  }

  List<Map<String, dynamic>> getAllCartItems() {
    return box.values
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }

  Future<void> removeCartItem(String bookId) async {
    await box.delete(bookId);
  }

  Future<void> clearCart() async {
    await box.clear();
  }
}