import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../bloc/add_bloc.dart';

class Imagepickerscreen extends StatelessWidget{
  const Imagepickerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      DottedBorder(
        child: GestureDetector(onTap: (){
          print("object3");
          _showBottomSheet(context);
          // SnackBar;
        },
          child: Container(
            height: 220,
            width: 300,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/book_bg.png'),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_a_photo_outlined,
                      color: AppColors.primaryBrown.withOpacity(0.4),
                      size: 40,
                    ),
                    Icon(
                      Icons.image,
                      color: AppColors.primaryBrown.withOpacity(0.4),
                      size: 40,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text("Şəkil əlavə et"),
              ],
            ),
          ),
        ),

    );}}



    void _showBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('Kameradan çək'),
                    onTap: () {
                      Navigator.pop(context);
                      context.read<AddBloc>().add(PickFromCamera());
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Qalereyadan seç'),
                    onTap: () {
                      Navigator.pop(context);
                      context.read<AddBloc>().add(PickFromGallery());
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
