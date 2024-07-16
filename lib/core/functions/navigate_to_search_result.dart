import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixels_app/Features/search/presentation/manager/search_by_query_cubit/search_by_query_cubit.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_view_result.dart';

void navigateToSearchResult(BuildContext context, String query) {
  query = query.trim(); // Trim whitespace
  if (query.isNotEmpty) {
    BlocProvider.of<SearchByQueryCubit>(context)
        .fetchImagesBySearch(query: query);
    debugPrint('Bloc fetchImagesBySearch called'); // Debugging line
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchViewResult(query: query),
      ),
    );
  } else {
    // Optionally show a message if the query is empty
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter a search query')),
    );
  }
}
