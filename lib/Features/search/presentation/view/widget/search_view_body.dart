import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixels_app/Features/home/presentation/view/widget/custom_grid_view_fading_indcator.dart';
import 'package:pixels_app/Features/search/presentation/manager/search_cubit/cubit/search_cubit.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/custom_text_form_feild.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_view.dart';
import 'package:pixels_app/core/widget/custom_error.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                    ),
                  ),
                  const Expanded(
                    child: CustomTextFormFeild(
                      hintText: 'Search pixels',
                      prefixIcon: Icon(Icons.search_outlined),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 14,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.zero,
            sliver: SliverToBoxAdapter(
              child: BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                if (state is SearchSuccess) {
                  return const SearchGridView(
                    imagePath: 'assets/test.jpg',
                  );
                } else if (state is SearchFailer) {
                  return CustomError(errMessage: state.errMessage);
                } else {
                  return const Center(
                    child: CustomGridViewFadingIndcator(),
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
