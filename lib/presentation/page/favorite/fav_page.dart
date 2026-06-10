import 'package:booksale/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class FavPage extends StatelessWidget {
  const FavPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Icon(Icons.notifications_off_sharp),
                Text('Favorilər boşdur', style: AppTextstyle.caption),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
