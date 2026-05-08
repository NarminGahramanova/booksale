

import 'package:booksale/presentation/page/cart/profil.dart';
import 'package:booksale/presentation/page/main/main_page.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/book.dart';
import '../../presentation/page/detail/detail_page.dart';
import '../../presentation/page/profil_page/profil_page.dart';
import '../../presentation/page/splash/splash_page.dart';
import 'custom_navigation_helper.dart';

final appRouter = GoRouter(
  initialLocation:CustomNavigationHelper.splashPath,
  routes: [
    GoRoute(
      path: CustomNavigationHelper.splashPath,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: CustomNavigationHelper.mainPath,
      builder: (context, state) => const MainPage(),
    ),
    // GoRoute(
    //   path: CustomNavigationHelper.detailPath,
    //   builder: (context, state) => const DetailPage(book: book,),
    // ),
    GoRoute(
      path: CustomNavigationHelper.cartPath,
      builder: (context, state) => const Profil(),
    ),
    GoRoute(
      path: CustomNavigationHelper.detailPath,
      builder: (context, state) {
        final book = state.extra as Book;
        return DetailPage(book: book);
      },
    ),
    GoRoute(
      path: CustomNavigationHelper.orderPath,
      builder: (context, state) =>  ProfilPage(),
    ),
  ],
);