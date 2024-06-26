import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixels_app/core/widget/custom_fading_animation.dart';
import 'package:pixels_app/Features/home/presentation/view/widget/custom_grid_item_fading_indicator.dart';

class CustomGridViewFadingIndcator extends StatelessWidget {
  const CustomGridViewFadingIndcator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingAnimation(
      child: Padding(
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
            crossAxisCount: 2,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return const CustomGridItemFadingIndicator();
            },
            childCount: 20,
          ),
        ),
      ),
    );
  }
}
