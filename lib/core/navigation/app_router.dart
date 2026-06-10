import 'package:booksale/presentation/page/auth/pages/forget_page.dart';
import 'package:booksale/presentation/page/auth/pages/login_page.dart';
import 'package:booksale/presentation/page/auth/pages/otp_page.dart';
import 'package:booksale/presentation/page/auth/pages/password_updated_page.dart';
import 'package:booksale/presentation/page/auth/pages/register_page.dart';
import 'package:booksale/presentation/page/auth/pages/reset_password_page.dart';
import 'package:booksale/presentation/page/main/main_page.dart';
import 'package:booksale/presentation/page/main/widget/notfications.dart';
import 'package:booksale/presentation/page/profil_page/address_screen.dart';
import 'package:booksale/presentation/page/profil_page/order_screen.dart';
import 'package:booksale/presentation/page/profil_page/payment_screen.dart';
import 'package:booksale/presentation/page/profil_page/settings_screen.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/book.dart';
import '../../presentation/page/cart/widgets/cart_item_.dart';
import '../../presentation/page/detail/detail_page.dart';
import '../../presentation/page/splash/splash_page.dart';
import 'custom_navigation_helper.dart';

final appRouter = GoRouter(
  initialLocation: CustomNavigationHelper.splashPath,
  routes: [
    GoRoute(
      path: CustomNavigationHelper.splashPath,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: CustomNavigationHelper.forgetPath,
      builder: (context, state) => const ForgetPage(),
    ),
    GoRoute(
      path: CustomNavigationHelper.registerPath,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: CustomNavigationHelper.loginPath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: CustomNavigationHelper.mainPath,
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: CustomNavigationHelper.otpPath,
      builder: (context, state) {
        final email = state.extra as String;
        return OtpPage(email: email);
      },
    ),

    GoRoute(
      path: CustomNavigationHelper.resetPath,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return ResetPasswordPage(
          email: extra['email'],
          resetToken: extra['resetToken'],
        );
      },
    ),
    GoRoute(
      path: CustomNavigationHelper.updatedPath,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return PasswordUpdatedPage();
      },
    ),
    GoRoute(
      path: CustomNavigationHelper.cartPath,
      builder: (context, state) => const CartPage(),
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
      builder: (context, state) => const OrderScreen(),
    ),
    GoRoute(
      path: CustomNavigationHelper.settingdPath,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: CustomNavigationHelper.adressPath,
      builder: (context, state) => const AddressScreen(),
    ),
    GoRoute(
      path: CustomNavigationHelper.paymentPath,
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: CustomNavigationHelper.notficationsPath,
      builder: (context, state) => const Notfications(),
    ),
  ],
);
