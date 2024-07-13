import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixels_app/Features/home/presentation/view/widget/custom_grid_view_fading_indcator.dart';
import 'package:pixels_app/Features/search/presentation/manager/search_cubit/cubit/search_cubit.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_item.dart';
import 'package:pixels_app/core/functions/navigate_to_imagedetails.dart';

class SearchGridView extends StatefulWidget {
  const SearchGridView({super.key});

  @override
  State<SearchGridView> createState() => _SearchGridViewState();
}

class _SearchGridViewState extends State<SearchGridView> {
  late ScrollController _scrollController;
  var nextPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    // Fetch initial images
    BlocProvider.of<SearchCubit>(context)
        .fetchImagesBySearch(pageNumber: nextPage, query: 'cat');
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollLength) {
      BlocProvider.of<SearchCubit>(context)
          .fetchImagesBySearch(pageNumber: ++nextPage, query: 'cat');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const CustomGridViewFadingIndcator();
          } else if (state is SearchFailer) {
            return Center(child: Text(state.errMessage));
          } else if (state is SearchSuccess) {
            return GridView.custom(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: SliverWovenGridDelegate.count(
                mainAxisSpacing: 0,
                crossAxisSpacing: 10,
                pattern: [
                  const WovenGridTile(0.8),
                  const WovenGridTile(
                    10 / 15,
                    crossAxisRatio: 1,
                    alignment: AlignmentDirectional.centerEnd,
                  ),
                ],
                crossAxisCount: 2,
              ),
              childrenDelegate: SliverChildBuilderDelegate((context, index) {
                return SearchGridItem(
                    onTap: () {
                      navigateToPreviewImagee(context, state, index);
                    },
                    imageUrl: state.images[index].imagePotraitPath);
              }, childCount: state.images.length),
            );
          } else {
            return const Center(child: Text('No results found'));
          }
        },
      ),
    );
  }
}
