import 'package:booksale/core/navigation/app_router.dart';
import 'package:booksale/presentation/page/auth/bloc/auth_bloc.dart';
import 'package:booksale/presentation/page/auth/pages/login_page.dart';
import 'package:booksale/presentation/page/cart/bloc/cart_bloc.dart';
import 'package:booksale/presentation/page/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // əlavə et
import 'package:shared_preferences/shared_preferences.dart';
import 'core/storage/local_stroage.dart';
import 'package:booksale/data/datasources/book_local_datasource.dart';
import 'package:booksale/data/models/book_model.dart';
import 'package:booksale/core/constants/hive_box.dart';
import 'core/theme/app_colors.dart';
import 'core/utils/mock_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = HiveLocalStorage();
  await storage.init();

  final bookDataSource = BookLocalDataSource(storage.getBox(HiveBoxes.books));

  if (bookDataSource.getAllBooks().isEmpty) {
    for (final book in mockBooks) {
      // await bookDataSource.saveBook(BookModel.fromEntity(book).toJson());
    }


  }
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  const MyApp({super.key,});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(create: (_) => CartBloc()),
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
      ],
      child: MaterialApp.router(

        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        title: 'BookSale',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.backgroundColor,
            background: AppColors.backgroundColor,
          ),
        ),
      ),
    );
  }
}