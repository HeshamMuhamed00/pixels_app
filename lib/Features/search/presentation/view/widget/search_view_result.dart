import 'package:flutter/material.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_view_result_body.dart';

class SearchViewResult extends StatelessWidget {
  const SearchViewResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchViewResultBody(),
    );
  }
}
