import 'package:booksale/presentation/page/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value){
        context.read<HomeBloc>().add(SearchBooks(value));
      },
      decoration: InputDecoration(
        hintText: 'Kitab axtar...',
        hintStyle: TextStyle(color: AppColors.dividerColor),
        prefixIcon: Icon(Icons.search,color: AppColors.primaryBrown,),
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
