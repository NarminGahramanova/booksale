import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDanger;

  const MenuItem({super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isDanger
                    ? const Color(0xFFFEEEEE)
                    : const Color(0xFFEEF3EF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 20,
                color: isDanger ? Colors.redAccent : const Color(0xFF2D6A4F),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: isDanger ? Colors.redAccent : const Color(0xFF1A1A1A),
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: isDanger ? Colors.redAccent : const Color(0xFFB0B8B0),
            ),
          ],
        ),
      ),
    );
  }
}
