import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_categories_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchCategoriesViewBody(query: query),
    );
  }
}
