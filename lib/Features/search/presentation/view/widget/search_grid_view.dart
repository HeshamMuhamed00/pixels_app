import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_item.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: GridView.custom(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // controller: _scrollController,
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
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return GestureDetector(
            onTap: () {
              // navigateToPreviewImage(context, state, index);
            },
            child: SearchGridItem(imageUrl: imagePath),
          );
        }, childCount: 30),
      ),
    );
  }
}
