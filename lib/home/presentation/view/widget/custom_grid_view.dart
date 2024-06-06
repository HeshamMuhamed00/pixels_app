import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pixels_app/home/presentation/view/widget/grid_item.dart';
import 'package:pixels_app/home/presentation/view/widget/image_details.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: GridView.custom(
        gridDelegate: SliverWovenGridDelegate.count(
            mainAxisSpacing: 0,
            crossAxisSpacing: 10,
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
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 250),
                      type: PageTransitionType.scale,
                      alignment: Alignment.bottomLeft,
                      child: const ImageDetails(),
                    ),
                  );

                  // GoRouter.of(context).push('/imageDetails');
                },
                child: const GridItem());
          },
        ),
      ),
    );
  }
}
