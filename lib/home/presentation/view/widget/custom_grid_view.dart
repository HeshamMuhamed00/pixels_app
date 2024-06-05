import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixels_app/home/presentation/view/widget/grid_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4.1 / 9,
      child: GridView.custom(
        gridDelegate: SliverWovenGridDelegate.count(
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            pattern: [
              const WovenGridTile(0.8),
              const WovenGridTile(
                10 / 15,
                crossAxisRatio: 1,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
            crossAxisCount: 2),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return const GridItem();
          },
        ),
      ),
    );
  }
}
