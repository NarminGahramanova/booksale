import 'package:booksale/presentation/page/add/widget/from_field.dart';
import 'package:booksale/presentation/page/add/widget/image_picker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import 'bloc/add_bloc.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Yeni Kitab Əlavə Et',
            style: TextStyle(
              fontFamily: "Newsreader",
              color: AppColors.primaryBrown,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: false,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.backgroundColor,

        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Imagepickerscreen(),
                SizedBox(height: 32,),
                FromField(),
              ],
            ),
          ),
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
    );
  }
}
