import 'package:booksale/core/navigation/custom_navigation_helper.dart';
import 'package:booksale/core/theme/app_colors.dart';
import 'package:booksale/core/theme/app_textstyle.dart';
import 'package:booksale/presentation/page/profil_page/widgets/menu_group.dart';
import 'package:booksale/presentation/page/profil_page/widgets/menu_item.dart';
import 'package:booksale/presentation/page/profil_page/widgets/stat_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/profile_model.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fakeUser = ProfileModel(
      name: 'Narmin Gahramanova',
      email: 'gahramanovanarmin02@gmail.com',
      booksBought: 13,
      wishlistCount: 5,
      avatarUrl: '',
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: Colors.transparent,
        title: const Text('Profil', style: AppTextstyle.appBarTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildAvatar(),
              const SizedBox(height: 12),
              Text(
                fakeUser.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                fakeUser.email,
                style: const TextStyle(fontSize: 13, color: Color(0xFF888888)),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      icon: Icons.menu_book_rounded,
                      label: 'Kitab Alınıb',
                      value: fakeUser.booksBought,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatCard(
                      icon: Icons.favorite_border,
                      label: 'İstək Siyahısı',
                      value: fakeUser.wishlistCount,
                      iconColor: const Color(0xFFB85C5C),
                      valueColor: const Color(0xFFB85C5C),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              MenuGroup(
                items: [
                  MenuItem(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Sifarişlərim',
                    onTap: () {
                      context.push(CustomNavigationHelper.orderPath);
                    },
                  ),
                  MenuItem(
                    icon: Icons.location_on_outlined,
                    title: 'Ünvanlarım',
                    onTap: () {
                      context.push(CustomNavigationHelper.adressPath);

                    },
                  ),
                  MenuItem(
                    icon: Icons.payments_outlined,
                    title: 'Ödəniş üsulları',
                    onTap: () {
                      context.push(CustomNavigationHelper.paymentPath);
                    },

                  ),
                ],
              ),

              const SizedBox(height: 12),

              MenuGroup(
                items: [
                  MenuItem(
                    icon: Icons.settings,
                    title: 'Parametrlər',
                    onTap: () {
                      context.push(CustomNavigationHelper.settingdPath);

                    },
                  ),
                  MenuItem(
                    icon: Icons.exit_to_app,
                    title: 'Çıxış',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Çıxış'),
                          content: const Text(
                            'Hesabdan çıxmaq istədiyinizə əminsiniz?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Xeyr',
                                style: TextStyle(color: AppColors.priceColor),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                               context.go(CustomNavigationHelper.loginPath);
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                              child: const Text('Bəli'),
                            ),
                          ],
                        ),
                      );
                    },
                    isDanger: true,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF2D6A4F), width: 3),
            image: const DecorationImage(
              image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/149/149071.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              color: Color(0xFF2D6A4F),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.edit, color: Colors.white, size: 14),
          ),
        ),
      ],
    );
  }
}
