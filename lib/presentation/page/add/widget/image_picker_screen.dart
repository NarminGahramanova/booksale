import 'dart:io';
import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/navigation/widgets/show_bottom_sheet.dart';
import '../../../../core/theme/app_colors.dart';
import '../bloc/add_bloc.dart';

class Imagepickerscreen extends StatelessWidget {
  const Imagepickerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBloc, AddState>(
      builder: (context, state) {
        final hasImage = state is ImageLoaded && state.images.isNotEmpty;

        return GestureDetector(
          onTap: () => showImagePickerSheet(context),
          child: DottedBorder(
            child: Container(
              height: 220,
              width: 300,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/book_bg.png'),
                  fit: BoxFit.contain,
                ),
              ),
              child: hasImage
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(state.images.last),
                  fit: BoxFit.cover,
                  width: 300,
                  height: 220,
                ),
              )
                  : Column(
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
        );
      },
    );
  }
}