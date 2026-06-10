
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextstyle {
  static const appBarTitle = TextStyle(
    fontFamily: "Newsreader",
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    color: AppColors.primaryBrown,
  );
  static const TextStyle headingLarge=TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    fontFamily: "Newsreader",
    // fontFamily:
  );
  static const TextStyle headingMedium=TextStyle(
    fontSize: 32,
    fontFamily: "Newsreader",
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBrown,
  );
  static const TextStyle bookTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    color: AppColors.textDark,
  );
  static const TextStyle bookAuthor=TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: AppColors.badgeNew,
  );
  static const TextStyle bookPrice=TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.priceColor,
  );
  static const TextStyle badgeText=TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.accentGreen,
  );
  static const priceBadge = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );
  static const TextStyle caption=TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.badgeNew,
  );
  static const buttonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const profileTitle = TextStyle(
    fontSize: 32,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryBrown,
  );
  static const bestseller = TextStyle(
    color: AppColors.priceColor,
    fontWeight: FontWeight.w700,
  );
  static const cardLabel = TextStyle(
    color: Color(0xFFBDBDBD),
    fontSize: 10,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.1,
  );
  static const cardValue = TextStyle(
    color: Colors.black87,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const sectionTitle = TextStyle(
    fontStyle: FontStyle.italic,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryBrown,
  );
  static const bodyText = TextStyle(
    fontSize: 16,
    height: 1.5,
    color: Colors.black87,
  );

}