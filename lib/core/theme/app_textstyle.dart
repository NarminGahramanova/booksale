
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextstyle {

  static const TextStyle headingLarge=TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
    // fontFamily:
  );
  static const TextStyle headingMedium=TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBrown,
  );
  static const TextStyle bookTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textDark,
  );
  static const TextStyle bookAuthor=TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
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
  static const TextStyle caption=TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.badgeNew,
  );
}