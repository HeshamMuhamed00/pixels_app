import 'package:flutter/cupertino.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_view_item.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 1.8,
      children: const [
        SearchGridItem(categoryName: 'Beach', image: 'assets/beach.jpg'),
        SearchGridItem(
            categoryName: 'Black & White', image: 'assets/black_and_white.jpg'),
        SearchGridItem(categoryName: 'Car', image: 'assets/car.jpg'),
        SearchGridItem(categoryName: 'Diving', image: 'assets/diving.jpg'),
        SearchGridItem(categoryName: 'Forest', image: 'assets/forest.jpg'),
        SearchGridItem(
            categoryName: 'Landscape', image: 'assets/landscape.jpg'),
        SearchGridItem(categoryName: 'Fitness', image: 'assets/Fitness.jpg'),
        SearchGridItem(
            categoryName: '4K Wallpaper', image: 'assets/4k_WallPaper.jpg'),
      ],
    );
  }
}
