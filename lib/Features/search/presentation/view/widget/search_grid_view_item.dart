import 'dart:ui';

import 'package:flutter/material.dart';

class SearchGridItem extends StatelessWidget {
  const SearchGridItem(
      {super.key, this.onTap, required this.categoryName, required this.image});
  final String categoryName, image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 12 / 2,
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover, // Ensures the image covers the container
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(
                16), // Applies the border radius to the blur effect
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.7, sigmaY: 0.7),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black87
                      .withOpacity(0.2), // Adjust the opacity as needed
                  borderRadius: BorderRadius.circular(
                      16), // Keeps the same border radius for the blurred container
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              categoryName,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
