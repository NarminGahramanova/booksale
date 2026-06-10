import 'package:booksale/core/navigation/custom_navigation_helper.dart';
import 'package:booksale/core/theme/app_colors.dart';
import 'package:booksale/core/theme/app_textstyle.dart';
import 'package:booksale/presentation/page/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.go(CustomNavigationHelper.mainPath);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: AppColors.primaryBrown,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 10,
                            child: Image.network(
                              'https://img.icons8.com/ios-filled/512/ffffff/open-book.png',
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        children: [
                          Text(
                            "Yeni hesab yarat",
                            style: AppTextstyle.bestseller.copyWith(fontSize: 24),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              'Kitab dünyasına xoş gəlmisiniz. Qeydiyyatdan keçin və kəşf etməyə başlayın.',
                              style: AppTextstyle.bestseller.copyWith(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 36),
                          _buildLoginInput(
                            title: "Tam adınız",
                            hintText: "Ad və soyad",
                            prefixIcon: Icons.person_outline,
                            controller: _nameController,
                          ),
                          _buildLoginInput(
                            title: "E-poçt ünvanı",
                            hintText: "nümunə@mail.com",
                            prefixIcon: Icons.mail_outline,
                            controller: _emailController,
                          ),
                          _buildLoginInput(
                            title: "Telefon nömrəsi",
                            hintText: "+994 -- --- -- --",
                            prefixIcon: Icons.call,
                            controller: _phoneController,
                          ),
                          _buildLoginInput(
                            title: "Şifrə",
                            hintText: "••••••••",
                            prefixIcon: Icons.lock_outline,
                            isPassword: true,
                            controller: _passwordController,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "İstifadə şərtləri və Məxfilik siyasəti ilə razıyam.",
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: state is AuthLoading
                                  ? null
                                  : () {
                                context.read<AuthBloc>().add(
                                  RegisterRequested(
                                    fullName: _nameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    phone: _phoneController.text.trim(),
                                    password: _passwordController.text,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.priceColor,
                              ),
                              child: state is AuthLoading
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : Text(
                                'Qeydiyyatdan keç',
                                style: AppTextstyle.bestseller.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 48),
                          Row(
                            children: [
                              Expanded(child: Divider(color: Colors.grey[300], height: 1)),
                              const Text("  Və ya  "),
                              Expanded(child: Divider(color: Colors.grey[300], height: 1)),
                            ],
                          ),
                          const SizedBox(height: 48),
                          RichText(
                            text: TextSpan(
                              text: "Artıq hesabınız var? ",
                              style: AppTextstyle.caption.copyWith(fontSize: 15),
                              children: [
                                WidgetSpan(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.go(CustomNavigationHelper.loginPath);
                                    },
                                    child: const Text(
                                      "Daxil olun",
                                      style: AppTextstyle.bestseller,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _buildLoginInput({
  required String title,
  required String hintText,
  required IconData prefixIcon,
  IconData? suffixIcon,
  bool isPassword = false,
  TextEditingController? controller,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextstyle.bestseller),
        const SizedBox(height: 12),
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFB8C1BC)),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            style: const TextStyle(fontSize: 18, color: Color(0xFF3F4A46)),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 18, color: Color(0xFFB8C1BC)),
              prefixIcon: Icon(prefixIcon, color: const Color(0xFF7A847F), size: 28),
              suffixIcon: suffixIcon != null
                  ? Icon(suffixIcon, color: const Color(0xFF7A847F), size: 28)
                  : null,
            ),
          ),
        ),
      ],
    ),
  );
}