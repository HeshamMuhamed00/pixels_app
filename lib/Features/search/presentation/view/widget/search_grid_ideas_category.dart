import 'package:flutter/cupertino.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_category_grid_view_item.dart';

class SearchGridIdeasCategory extends StatelessWidget {
  const SearchGridIdeasCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 1.8,
      children: const [
        SearchCategoryGridItem(
            categoryName: 'Beach', image: 'assets/beach.jpg'),
        SearchCategoryGridItem(
            categoryName: 'Black & White', image: 'assets/black_and_white.jpg'),
        SearchCategoryGridItem(categoryName: 'Car', image: 'assets/car.jpg'),
        SearchCategoryGridItem(
            categoryName: 'Diving', image: 'assets/diving.jpg'),
        SearchCategoryGridItem(
            categoryName: 'Forest', image: 'assets/forest.jpg'),
        SearchCategoryGridItem(
            categoryName: 'Landscape', image: 'assets/landscape.jpg'),
        SearchCategoryGridItem(
            categoryName: 'Fitness', image: 'assets/Fitness.jpg'),
        SearchCategoryGridItem(
            categoryName: '4K Wallpaper', image: 'assets/4k_WallPaper.jpg'),
      ],
    );
  }
}
