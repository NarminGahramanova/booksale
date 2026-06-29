import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import 'bloc/home_bloc.dart';

class ProductListsType extends StatelessWidget {
  const ProductListsType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is! HomeLoaded) return const SizedBox();

        return SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.length,
            itemBuilder: (context, index) {
              final isSelected = state.selectedIndex == index;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(5)
                    ),
                    backgroundColor: isSelected
                        ? AppColors.primaryBrown
                        : AppColors.accentGrey,
                    foregroundColor: isSelected
                        ? Color(0xFFFFFFFF)
                        : AppColors.badgeNew,
                  ),
                  onPressed: () {
                    context.read<HomeBloc>().add(CategorySelected(index));
                  },
                  child: Text(state.categories[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
