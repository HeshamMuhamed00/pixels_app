import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pixels_app/core/widget/custom_error.dart';
import 'package:pixels_app/home/presentation/manager/image_cubit/cubit/image_cubit.dart';
import 'package:pixels_app/home/presentation/view/widget/grid_item.dart';
import 'package:pixels_app/home/presentation/view/widget/image_details.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        if (state is ImageSuccess) {
          return Padding(
            padding: const EdgeInsets.only(left: 6, right: 6),
            child: GridView.custom(
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
                  crossAxisCount: 2),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 250),
                            type: PageTransitionType.scale,
                            alignment: Alignment.bottomLeft,
                            child: const ImageDetails(),
                          ),
                        );

                        // GoRouter.of(context).push('/imageDetails');
                      },
                      child: const GridItem());
                },
              ),
            ),
          );
        } else if (state is ImageFailure) {
          return CustomError(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
