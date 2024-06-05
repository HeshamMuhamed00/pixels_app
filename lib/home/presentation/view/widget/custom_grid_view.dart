import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixels_app/home/presentation/view/widget/grid_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverWovenGridDelegate.count(pattern: [
        const WovenGridTile(1),
        const WovenGridTile(
          5 / 7,
          crossAxisRatio: 0.9,
          alignment: AlignmentDirectional.centerEnd,
        ),
      ], crossAxisCount: 2),
      childrenDelegate: SliverChildBuilderDelegate((context, index) {
        return const GridItem();
      }),
    );
  }
}
