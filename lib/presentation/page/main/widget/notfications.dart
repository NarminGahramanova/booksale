import 'package:booksale/core/navigation/custom_navigation_helper.dart';
import 'package:booksale/core/theme/app_colors.dart';
import 'package:booksale/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Notfications extends StatelessWidget {
  const Notfications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(onPressed: (){
         context.go(CustomNavigationHelper.mainPath);
        }, icon: Icon(Icons.arrow_back)),
      ),
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
                Icon(Icons.notifications_off_sharp,),
              Text('Məlumat tapılmadı',style: AppTextstyle.caption,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
