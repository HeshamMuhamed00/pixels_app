import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  const CustomTextFormFeild({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.onChanged,
  });
  final String hintText;
  final Widget prefixIcon;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextFormField(
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          iconColor: Colors.white,
          contentPadding: const EdgeInsets.all(8),
          prefixIcon: prefixIcon,
          prefixIconColor: Colors.grey,
          filled: true,
          fillColor: const Color(0xff141414),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
