import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomGridItemFadingIndicator extends StatelessWidget {
  const CustomGridItemFadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}
