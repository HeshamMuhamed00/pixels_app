import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pixels_app/core/functions/navigate_to_imagedetails.dart';
import 'package:pixels_app/core/widget/custom_error.dart';
import 'package:pixels_app/Features/home/presentation/manager/image_cubit/cubit/image_cubit.dart';
import 'package:pixels_app/Features/home/presentation/view/widget/custom_grid_view_fading_indcator.dart';
import 'package:pixels_app/Features/home/presentation/view/widget/grid_item.dart';

class CustomGridView extends StatefulWidget {
  const CustomGridView({super.key});

  @override
  State<StatefulWidget> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  late ScrollController _scrollController;
  var nextPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    // Fetch initial images
    BlocProvider.of<ImageCubit>(context).fetchImages(pageNumber: nextPage);
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
      BlocProvider.of<ImageCubit>(context).fetchImages(pageNumber: ++nextPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        if (state is ImageSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: GridView.custom(
              controller: _scrollController,
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
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      navigateToPreviewImage(context, state, index);
                    },
                    child: GridItem(
                      imageUrl: state.images[index].imagePotraitPath,
                    ),
                  );
                },
                childCount: state.images.length,
              ),
            ),
          );
        } else if (state is ImageFailure) {
          return CustomError(errMessage: state.errMessage);
        } else {
          return const Center(
            child: CustomGridViewFadingIndcator(),
          );
        }
      },
    );
  }
}
