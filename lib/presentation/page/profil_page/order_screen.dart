import 'package:booksale/presentation/page/profil_page/%20bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc()..add(LoadOrders()),      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.primaryBrown,
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state is OrderLoaded
                        ? (state as OrderLoaded).categories.length
                        : 0,
                    itemBuilder: (context, index) {
                      final isSelected = state is OrderLoaded
                          ? (state as OrderLoaded).selectedIndex == index
                          : false;
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
                            context.read<OrderBloc>().add(
                                OrderCategorySelected(index: index));
                          },
                          child: Text(
                              (state as OrderLoaded).categories[index]),),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
