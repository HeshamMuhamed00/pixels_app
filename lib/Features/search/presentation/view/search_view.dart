import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixels_app/Features/home/data/repo/image_repo_impl.dart';
import 'package:pixels_app/Features/search/presentation/manager/search_by_query_cubit/search_by_query_cubit.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_categories_view_body.dart';
import 'package:pixels_app/core/utils/service_locator.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchByQueryCubit(getIt.get<ImageRepoImpl>())
        ..fetchImagesBySearch(query: query),
      child: Scaffold(
        body: SearchCategoriesViewBody(query: query),
      ),
    );
  }
}
