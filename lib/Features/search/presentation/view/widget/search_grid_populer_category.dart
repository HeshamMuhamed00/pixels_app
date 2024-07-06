import 'package:flutter/cupertino.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_category_grid_view_item.dart';

class SearchGridPopulerCategory extends StatelessWidget {
  const SearchGridPopulerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 90),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 1.8,
      children: const [
        SearchCategoryGridItem(
            categoryName: 'Animal', image: 'assets/animal.jpg'),
        SearchCategoryGridItem(
            categoryName: 'Autumn', image: 'assets/autumn.jpg'),
        SearchCategoryGridItem(categoryName: 'City', image: 'assets/city.jpg'),
        SearchCategoryGridItem(
            categoryName: 'Night', image: 'assets/night.jpg'),
        SearchCategoryGridItem(
            categoryName: 'Portrait', image: 'assets/portrait.jpg'),
        SearchCategoryGridItem(categoryName: 'Rain', image: 'assets/rain.jpg'),
        SearchCategoryGridItem(
            categoryName: 'Summer', image: 'assets/summer.jpg'),
        SearchCategoryGridItem(
            categoryName: 'Sunset ', image: 'assets/sunset.jpg'),
      ],
    );
  }
}
