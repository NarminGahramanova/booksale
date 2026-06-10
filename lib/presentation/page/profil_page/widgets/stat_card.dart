import 'package:flutter/material.dart';


class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final int value;
  final Color iconColor;
  final Color valueColor;

  const StatCard({
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor = const Color(0xFF2D6A4F),
    this.valueColor = const Color(0xFF2D6A4F),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 8),
          Text(
            '$value',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Color(0xFF888888)),
          ),
        ],
      ),
    );
  }
}
