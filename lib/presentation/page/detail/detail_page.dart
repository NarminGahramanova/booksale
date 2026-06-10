import 'package:booksale/core/theme/app_colors.dart';
import 'package:booksale/core/theme/app_textstyle.dart';
import 'package:booksale/domain/entities/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/book.dart';
import '../cart/bloc/cart_bloc.dart';

class DetailPage extends StatelessWidget {
  final Book book;

  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppColors.primaryBrown),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.favorite_border, color: AppColors.primaryBrown),
          ),
        ],
        title: Text("Kitab Bazarı", style: AppTextstyle.appBarTitle),
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 400,
                      child: Image.network(book.imageUrl),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.priceColor,
                        ),
                        width: 140,
                        height: 50,

                        child: Center(
                          child: Text(
                            " ${book.price} AZN",
                            style: AppTextstyle.priceBadge,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 32,
                        height: 11,
                        child: Divider(color: AppColors.priceColor),
                      ),
                      SizedBox(width: 10),
                      Text('BESTSELLER', style: AppTextstyle.bestseller),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(book.title, style: AppTextstyle.profileTitle),
                      Text(book.author, style: AppTextstyle.bookAuthor),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.8,
                  ),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    List<String> titles = ["NƏŞRİYYAT", "KATEQORİYA"];
                    List<String> values = [book.publisher, book.category];
                    return Card(
                      color: Colors.white,
                      elevation: 0.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(titles[index], style: AppTextstyle.cardLabel),
                            const SizedBox(height: 4),
                            Text(values[index], style: AppTextstyle.cardValue),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Təsvir', style: AppTextstyle.sectionTitle),
                      Text(book.description, style: AppTextstyle.bodyText),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CartBloc>().add(
                        AddToCartEvent(
                          product: CartItem(book: book, quantity: 1),
                        ),
                      );
                      context.push('/cart');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBrown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Səbətə Əlavə Et",
                      style: AppTextstyle.buttonText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
