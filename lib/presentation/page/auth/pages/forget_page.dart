
import 'package:booksale/core/theme/app_colors.dart';
import 'package:booksale/core/theme/app_textstyle.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/custom_navigation_helper.dart';

class ForgetPage extends StatefulWidget {
  const ForgetPage({super.key});

  @override
  State<ForgetPage> createState() => _ForgetPage();
}

class _ForgetPage extends State<ForgetPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  static const Color primaryGreen = Color(0xFF1D6B4E);
  static const Color lightGreen = Color(0xFFE1F5EE);
  static const Color bgColor = Color(0xFFF5F7F5);

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryGreen),
          onPressed: () => context.go(CustomNavigationHelper.loginPath),
        ),
        title: const Text(
          'Kitab Bazari',
          style: AppTextstyle.appBarTitle
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),

            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    color: AppColors.priceColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.lock_reset,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                Positioned(
                  right: -5,
                  bottom: -5,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: AppColors.primaryBrown,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.key,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

             Text(
              'Şifrəni bərpa et',
              style: AppTextstyle.headingMedium.copyWith(fontSize: 28)
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'E-poçt ünvanınızı daxil edin, biz sizə bərpa kodu göndərəcəyik',
                textAlign: TextAlign.center,
                style: AppTextstyle.caption
              ),
            ),

            const SizedBox(height: 28),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE5E7EB), width: 0.5),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                     Text(
                      'E-poçt ünvanı',
                      style: AppTextstyle.cardLabel.copyWith(fontSize: 14,fontWeight: FontWeight.normal)
                    ),
                    const SizedBox(height: 6),

                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'nümunə@mail.com',
                        hintStyle: const TextStyle(color: Color(0xFFB0B5BE)),
                        prefixIcon: const Icon(
                          Icons.mail_outline,
                          color: Color(0xFFB0B5BE),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.priceColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.priceColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.priceColor, width: 1.5),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          if (_emailController.text.isEmpty) return;

                          final dio = Dio(BaseOptions(baseUrl: 'https://kitab-bazari-api.onrender.com'));

                          try {
                            final response = await dio.post('/api/auth/forgot-password', data: {
                              'email': _emailController.text.trim(),
                            });

                            if (response.statusCode == 200) {
                              if (!context.mounted) return;
                              context.go(CustomNavigationHelper.otpPath,extra: _emailController.text.trim());
                            } else {if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Xəta baş verdi')),
                              );
                            }
                          } catch (e) {if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Xəta: $e')),
                            );
                          }
                        },
                        icon: const Icon(Icons.send, size: 18, color: Colors.white),
                        label: Text(
                          'Göndər',
                          style: AppTextstyle.sectionTitle.copyWith(color: Colors.white, fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.priceColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),


                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}