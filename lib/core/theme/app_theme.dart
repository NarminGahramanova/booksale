import 'package:booksale/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: ColorScheme.light(primary: AppColors.primaryBrown),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.textDark,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColors.textDark),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      // selectedIconTheme: AppColors.primaryBrown,
      // unselectedIconTheme: AppColors.textLight,
      elevation: 0,
    ),
    dividerColor: AppColors.dividerColor,
  );
}
