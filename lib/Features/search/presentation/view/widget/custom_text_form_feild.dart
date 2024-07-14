import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFeild extends StatefulWidget {
  const CustomTextFeild({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.onSubmitted,
  });
  final String hintText;
  final Widget prefixIcon;
  final Function(String)? onSubmitted;

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: TextField(
        controller: textEditingController,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
        ],
        onSubmitted: widget.onSubmitted,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          iconColor: Colors.white,
          contentPadding: const EdgeInsets.all(8),
          prefixIcon: widget.prefixIcon,
          prefixIconColor: Colors.grey,
          filled: true,
          fillColor: const Color(0xff141414),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
