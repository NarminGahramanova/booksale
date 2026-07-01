
import 'package:flutter/material.dart';

import 'menu_item.dart';

class MenuGroup extends StatelessWidget {
  final List<MenuItem> items;

  const MenuGroup({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          return Column(
            children: [
              items[index],
              if (index < items.length - 1)
                Divider(
                  height: 1,
                  indent: 16,
                  endIndent: 16,
                  color: Colors.grey.withValues(alpha: 0.15),
                ),
            ],
          );
        }),
      ),
    );
  }
}