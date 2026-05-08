import 'package:booksale/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'core/storage/local_stroage.dart';
import 'package:booksale/data/datasources/book_local_datasource.dart';
import 'package:booksale/data/models/book_model.dart';
import 'package:booksale/core/constants/hive_box.dart';
import 'core/utils/mock_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// biz bunu presentation da yaradacagimiz meselen mainpage deki bloca atiriq
  final storage = HiveLocalStorage();
  await storage.init();

  final bookDataSource = BookLocalDataSource(storage.getBox(HiveBoxes.books));

  if (bookDataSource.getAllBooks().isEmpty) {
    for (final book in mockBooks) {
      await bookDataSource.saveBook(BookModel.fromEntity(book).toJson());
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // theme: ThemeData(
      //   fontFamily: "Newsreader",
      // ),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'BookSale',
    );
  }
}