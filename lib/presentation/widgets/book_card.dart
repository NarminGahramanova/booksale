import 'package:booksale/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/detail', extra: book),
      child: Card(
        elevation: 0,
        shape: BeveledRectangleBorder(
          side: BorderSide.none,
        ),
        color: AppColors.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network(book.imageUrl, height: 130),
            ),
            SizedBox(height: 8),
            Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
              Text(book.title, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(book.author, style: TextStyle(fontSize: 12)),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  '${book.price} AZN',
                  style: TextStyle(
                    color: AppColors.priceColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],)

          ],
        ),
      ),
    );
  }
}