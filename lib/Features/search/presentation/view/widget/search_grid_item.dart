import 'package:flutter/material.dart';

class SearchGridItem extends StatelessWidget {
  const SearchGridItem({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(imageUrl),
        ),
      ),
    );
  }
}
