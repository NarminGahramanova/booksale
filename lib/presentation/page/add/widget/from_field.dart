import 'package:booksale/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FromField extends StatelessWidget {
  FromField({super.key});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _publisherController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCustomInput(
          label: "Kitabın adı",
          hint: "Məs: Kürk Mantolu Madonna",
          controller: _titleController,
        ),
        _buildCustomInput(
          label: "Müəllif",
          hint: "Məs: Sabahattin Ali",
          controller: _authorController,
        ),
        _buildCustomInput(
          label: "Nəşriyyat",
          hint: "Məs: Yapı Kredi Yayınları",
          controller: _publisherController,
        ),
        _buildCustomInput(
          label: "İl",
          hint: "Məs: 2021",
          controller: _yearController,
          isNumeric: true,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBrown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "YADDA SAXLA",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildCustomInput({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isNumeric = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryBrown,
            ),
          ),
          const SizedBox(height: 10),

          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE0E0E0)),
            ),
            child: TextField(
              controller: controller,
              keyboardType: isNumeric
                  ? TextInputType.number
                  : TextInputType.text,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
