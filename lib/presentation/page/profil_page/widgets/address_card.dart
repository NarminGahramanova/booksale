import 'package:flutter/material.dart';

import 'package:booksale/core/theme/app_colors.dart';
import 'package:booksale/core/theme/app_textstyle.dart';

class AddressCard extends StatelessWidget {
  final String title;
  final String street;
  final String city;
  final String? phone;
  final IconData icon;
  final Color iconBgColor;
  final bool isMain;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const AddressCard({
    super.key,
    required this.title,
    required this.street,
    required this.city,
    this.phone,
    required this.icon,
    required this.iconBgColor,
    this.isMain = false,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        icon,
                        color: isMain ? AppColors.priceColor : Colors.black54,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(title, style: AppTextstyle.appBarTitle),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit_outlined,
                          color: Colors.black45, size: 20),
                      onPressed: onEdit,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                      icon: Icon(Icons.delete_outline,
                          color: AppColors.badgeNew, size: 20),
                      onPressed: onDelete,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 4),
                  ],
                ),
                const SizedBox(height: 12),
                Text(street, style: AppTextstyle.bestseller),
                const SizedBox(height: 4),
                Text(city, style: AppTextstyle.bestseller),
                if (phone != null) ...[
                  const SizedBox(height: 4),
                  Text(phone!, style: AppTextstyle.bestseller),
                ],
              ],
            ),
          ),

          if (isMain)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                 color: AppColors.primaryBrown,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Text('Əsas', style: AppTextstyle.cardLabel),
              ),
            ),
        ],
      ),
    );
  }
}