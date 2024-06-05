import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 9 / 4,
      child: Image(
        image: AssetImage('assets/pexels.jpg'),
      ),
    );
  }
}
