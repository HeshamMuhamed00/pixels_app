import 'package:flutter/cupertino.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_view_item.dart';

class SearchGridPopulerCategory extends StatelessWidget {
  const SearchGridPopulerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 1.8,
      children: const [
        SearchGridItem(categoryName: 'Animal', image: 'assets/animal.jpg'),
        SearchGridItem(categoryName: 'Autumn', image: 'assets/autumn.jpg'),
        SearchGridItem(categoryName: 'City', image: 'assets/city.jpg'),
        SearchGridItem(categoryName: 'Night', image: 'assets/night.jpg'),
        SearchGridItem(categoryName: 'Portrait', image: 'assets/portrait.jpg'),
        SearchGridItem(categoryName: 'Rain', image: 'assets/rain.jpg'),
        SearchGridItem(categoryName: 'Summer', image: 'assets/summer.jpg'),
        SearchGridItem(categoryName: 'Sunset ', image: 'assets/sunset.jpg'),
      ],
    );
  }
}
