import 'package:flutter/material.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          'Ideas for you',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(
          height: 12,
        ),
        Expanded(child: SearchGridView()),
        Text(
          'Ideas for you',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Expanded(child: SearchGridView()),
      ],
    );
  }
}
