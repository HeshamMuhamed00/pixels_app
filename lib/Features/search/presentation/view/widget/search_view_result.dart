import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixels_app/Features/home/data/repo/image_repo_impl.dart';
import 'package:pixels_app/Features/search/presentation/manager/search_cubit/cubit/search_cubit.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_view_result_body.dart';
import 'package:pixels_app/core/utils/service_locator.dart';

class SearchViewResult extends StatelessWidget {
  const SearchViewResult({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<ImageRepoImpl>())
        ..fetchImagesBySearch(query: query),
      child: const Scaffold(
        body: SearchViewResultBody(),
      ),
    );
  }
}
