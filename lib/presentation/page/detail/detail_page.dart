import 'dart:ui';
import 'package:booksale/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/book.dart';

class DetailPage extends StatelessWidget {
  final Book book;

  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    print(book.description);

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
        title: Text(
          "Kitab Bazarı",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            fontFamily: "Newsreader",
            color: AppColors.primaryBrown,
          ),
        ),
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
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
                      Text(
                        'BESTSELLER',
                        style: TextStyle(
                          color: AppColors.priceColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: AppColors.primaryBrown,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        book.author,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
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
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    List<String> titles = [
                      "NƏŞRİYYAT",
                      "İL",
                      "VƏZİYYƏT",
                      "KATEQORİYA",
                    ];
                    // List<String> values = ["Qanun\nNəşriyyatı", "2021", "Yeni kimi", "Klassika"];
                    List<String> values = [
                      book.publisher,
                      book.year,
                      book.condition,
                      book.category,
                    ];
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
                            Text(
                              titles[index],
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.1,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              values[index],
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
                      Text(
                        'Təsvir',
                        style: TextStyle(
                          color: AppColors.primaryBrown,
                          fontStyle: FontStyle.italic,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        book.description,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 12),

                    ],

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print('object');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBrown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Səbətə Əlavə Et",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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
