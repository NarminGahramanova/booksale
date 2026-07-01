import 'package:booksale/core/theme/app_colors.dart';
import 'package:booksale/core/theme/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/navigation/custom_navigation_helper.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthSuccess) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString('userName', state.user['fullName'] ?? '');
          await prefs.setString('userEmail', state.user['email'] ?? '');
          if (!context.mounted) return;
          context.go(CustomNavigationHelper.mainPath);
  }
      },
      builder: (context, state) {
        return Scaffold(

          body: SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                            "Kitab Bazarı",
                            style: AppTextstyle.appBarTitle.copyWith(fontSize: 20),
                          ),
                          const SizedBox(height: 24),
                          Text('Xoş gəlmisiniz', style: AppTextstyle.headingMedium),
                          Text(
                            'Daxil olmaq üçün məlumatlarınızı qeyd edin',
                            style: AppTextstyle.bestseller.copyWith(color: Colors.grey),
                          ),
                          const SizedBox(height: 48),
                          _buildLoginInput(
                            title: "E-poçt ünvanı",
                            hintText: "nümunə@mail.com",
                            prefixIcon: Icons.mail_outline,
                            controller: _emailController,
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
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: InkWell(onTap: (){
                                context.go(CustomNavigationHelper.forgetPath);
                              },
                                child: Text(
                                  "Şifrəni unutmusunuz?",
                                  style: AppTextstyle.bestseller,
                                ),
                              ),
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
                                  LoginRequested(
                                    email: _emailController.text.trim(),
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
                                'Giriş et',
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
                              text: "Hesabınız yoxdur? ",
                              style: AppTextstyle.caption.copyWith(fontSize: 15),
                              children: [
                                WidgetSpan(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.go(CustomNavigationHelper.registerPath);
                                    },
                                    child: const Text(
                                      "Qeydiyyatdan keçin",
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