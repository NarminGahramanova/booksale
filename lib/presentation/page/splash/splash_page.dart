import 'package:booksale/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/navigation/custom_navigation_helper.dart';
import '../../../core/storage/local_stroage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Future<void> _navigateAfterAuth(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    final storage = HiveLocalStorage();
    final token = storage.getAccountToken();
    if (context.mounted) {
      if (isLoggedIn) {
        context.go(CustomNavigationHelper.mainPath);
      } else {
        context.go(CustomNavigationHelper.loginPath);
      }
    }

    if (!context.mounted) return;
    if (isLoggedIn) {
      context.go(CustomNavigationHelper.mainPath);
    } else {
      context.go(CustomNavigationHelper.loginPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    _navigateAfterAuth(context);
    return Scaffold(
      backgroundColor: AppColors.dividerColor,
      body: Center(
        child: Icon(Icons.message_outlined, color: Colors.white, size: 47),
      ),
    );
  }
}
