import 'package:flutter/material.dart';

import 'package:booksale/core/theme/app_textstyle.dart';

class AddressMapSection extends StatelessWidget {
  final VoidCallback onTap;

  const AddressMapSection({super.key, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 180,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1B3A2D), Color(0xFF2D5A42)],
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.92),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.explore_outlined,
                          size: 20, color: Colors.black87),
                      const SizedBox(width: 8),
                      Text('Xəritədə bax', style: AppTextstyle.bestseller),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



