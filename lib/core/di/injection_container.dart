import 'package:get_it/get_it.dart';
import 'package:booksale/core/dio/api_client.dart';

// Book
import 'package:booksale/data/datasources/book_remote_datasource.dart';
import 'package:booksale/data/repositories/book_repository_impl.dart';
import 'package:booksale/domain/repositories/book_repo.dart';

// Card
import 'package:booksale/data/datasources/card_remote_datasource.dart';
import 'package:booksale/data/repositories/card_repository_impl.dart';
import 'package:booksale/domain/repositories/card_repository.dart';
import 'package:booksale/domain/usecases/get_cards_usecase.dart';
import 'package:booksale/domain/usecases/add_card_usecase.dart';
import 'package:booksale/domain/usecases/delete_card_usecase.dart';


// Cart
import 'package:booksale/data/repositories/cart_repository_impl.dart';
import 'package:booksale/domain/repositories/cart_repo.dart';
import 'package:booksale/core/storage/local_stroage.dart';

import '../../data/datasources/cart_local_datasource.dart';
import '../../data/datasources/order_remote_datasource.dart';
import '../../data/repositories/order_repository_impl.dart';
import '../../domain/repositories/order_repo.dart';
import '../constants/hive_box.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  sl.registerLazySingleton(() => ApiClient().dio);

  final storage = HiveLocalStorage();
  await storage.init();

  // ---------------- Book ----------------
  sl.registerLazySingleton<BookRemoteDatasource>(
        () => BookRemoteDatasourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<BookRepo>(
        () => BookRepositoryImpl(datasource: sl()),
  );

  // ---------------- Card ----------------
  sl.registerLazySingleton<CardRemoteDataSource>(
        () => CardRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<CardRepository>(
        () => CardRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetCardsUseCase(repository: sl()));
  sl.registerLazySingleton(() => AddCardUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeleteCardUseCase(repository: sl()));

  // ---------------- Order ----------------
  sl.registerLazySingleton<OrderRemoteDatasource>(
        () => OrderRemoteDatasourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<OrderRepo>(
        () => OrderRepositoryImpl(datasource: sl()),
  );

  // ---------------- Cart ----------------
  sl.registerLazySingleton<CartLocalDatasource>(
        () => CartLocalDataSourceImpl(storage.getBox(HiveBoxes.cart)),
  );
  sl.registerLazySingleton<CartRepo>(
        () => CartRepoImpl(sl()),
  );
}