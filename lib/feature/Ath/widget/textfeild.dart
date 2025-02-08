import 'package:flutter/material.dart';

class Inputtext extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType type;
  final Icon iconData;
  final bool obscure;
  final TextEditingController? controller; // جعلها اختيارية
  final String? Function(String?)? validator; //

  const Inputtext({
    super.key,
    required this.label,
    required this.hint,
    required this.type,
    required this.iconData,
    this.obscure = false, // قيمة افتراضية false
    this.controller,// جعلها اختيارية
    this.validator, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
          controller: controller, 
          keyboardType: type,
          obscureText: obscure, // دعم إخفاء النص عند الحاجة
          decoration: InputDecoration(
            fillColor: Colors.grey[100],
            filled: true,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            prefixIcon: iconData,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
