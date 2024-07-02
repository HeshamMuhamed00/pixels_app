import 'package:flutter/cupertino.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_view_item.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 1.6,
      children: const [
        SearchGridItem(categoryName: 'Beach', image: 'assets/beach.png'),
        SearchGridItem(
            categoryName: 'Black & White', image: 'assets/black_and_white.png'),
        SearchGridItem(categoryName: 'Car', image: 'assets/car.png'),
        SearchGridItem(categoryName: 'Diving', image: 'assets/diving.png'),
        SearchGridItem(categoryName: 'Forest', image: 'assets/forest.png'),
        SearchGridItem(
            categoryName: 'Landscape', image: 'assets/landscape.png'),
      ],
    );
  }
}
