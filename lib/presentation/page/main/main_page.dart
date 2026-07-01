import 'package:booksale/core/theme/app_colors.dart';
import 'package:booksale/presentation/page/add/add_page.dart';
import 'package:booksale/presentation/page/favorite/fav_page.dart';
import 'package:booksale/presentation/page/home/home_page.dart';
import 'package:flutter/material.dart';
import '../cart/widgets/cart_item_.dart';
import '../profil_page/profil_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FavPage(),
    const AddPage(),
    const CartPage(),
    const ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.priceColor,
        ),
        child: IconButton(
          icon: const Icon(Icons.add, color: Colors.white, size: 25),
          onPressed: () => setState(() => _currentIndex = 2),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Əsas', 0),
              _buildNavItem(Icons.favorite, 'Sevimlilər', 1),
              const SizedBox(width: 40),
              _buildNavItem(Icons.shopping_cart, 'Səbət', 3),
              _buildNavItem(Icons.person, 'Profil', 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.priceColor : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? AppColors.priceColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}