import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool readOnly;
  final VoidCallback? onTap;
  final IconData? suffixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold ,
        fontSize: 16)),
        SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
              
            ),
            hintText: hint,
            suffixIcon: suffixIcon != null
                ? IconButton(icon: Icon(suffixIcon), onPressed: onTap)
                : null,
            focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.primaryColor)
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),

            ),
          ),
          validator: (value) => value!.isEmpty ? "$label is required" : null,
          onTap: onTap,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
