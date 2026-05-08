import 'package:booksale/core/constants/hive_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class LocalStorage {
  Future<void> init();
  Box getBox(String name);
  String? getAccountToken();
}

class HiveLocalStorage implements LocalStorage {
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveBoxes.books);
    await Hive.openBox(HiveBoxes.cart);
    await Hive.openBox(HiveBoxes.auth);
  }

  @override
  Box getBox(String name) {
    return Hive.box(name);
  }

  @override
  String? getAccountToken() {
    final box = Hive.box(HiveBoxes.auth);
    return box.get('token');
  }
}