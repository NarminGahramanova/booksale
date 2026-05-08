import 'package:hive_flutter/hive_flutter.dart';

class BookLocalDataSource {
  final Box box; // Hive-in saxlama qutusu

  BookLocalDataSource(this.box);//box-u kenardan veririk

  Future<void> saveBook(Map<String, dynamic> book) async {
    await box.put(book['id'], book);
  }

  Future<Map<String, dynamic>?> getBook(String id) async {
    final value = box.get(id);
    if (value == null) return null;
    return Map<String, dynamic>.from(value);
  }

  List<Map<String, dynamic>> getAllBooks() {
    return box.values
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }

  Future<void> deleteBook(String id) async {
    await box.delete(id);
  }
}