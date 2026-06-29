import 'package:booksale/core/navigation/app_router.dart';
import 'package:booksale/presentation/page/add/bloc/add_bloc.dart';
import 'package:booksale/presentation/page/auth/bloc/auth_bloc.dart';
import 'package:booksale/presentation/page/cart/bloc/cart_bloc.dart';
import 'package:booksale/presentation/page/profil_page/%20bloc/card_bloc.dart';
import 'package:booksale/presentation/page/profil_page/%20bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/dio/api_client.dart';
import 'core/storage/local_stroage.dart';
import 'package:booksale/data/datasources/book_local_datasource.dart';
import 'package:booksale/core/constants/hive_box.dart';
import 'core/theme/app_colors.dart';
import 'core/utils/mock_data.dart';
import 'data/datasources/card_remote_datasource.dart';
import 'data/repositories/card_repository_impl.dart';
import 'domain/usecases/add_card_usecase.dart';
import 'domain/usecases/delete_card_usecase.dart';
import 'domain/usecases/get_cards_usecase.dart';

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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(create: (_) => CartBloc()),
        BlocProvider<AuthBloc>(create: (_) => AuthBloc()),
        BlocProvider<AddBloc>(create: (_) => AddBloc()),
        BlocProvider<OrderBloc>(create: (_) => OrderBloc()),
        BlocProvider<CardBloc>(
          create: (_) {
            final dataSource = CardRemoteDataSourceImpl(dio: ApiClient().dio);
            final repository = CardRepositoryImpl(remoteDataSource: dataSource);
            return CardBloc(
              getCardsUseCase: GetCardsUseCase(repository: repository),
              addCardUseCase: AddCardUseCase(repository: repository),
              deleteCardUseCase: DeleteCardUseCase(repository: repository),
            )..add(LoadCards());
          },
        ),
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
