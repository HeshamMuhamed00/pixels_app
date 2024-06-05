import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: Colors.redAccent,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: const FittedBox(
          fit: BoxFit.fill,
          child: Image(
            image: AssetImage('assets/pexels.jpg'),
          ),
        ),
      ),
    );
  }
}
