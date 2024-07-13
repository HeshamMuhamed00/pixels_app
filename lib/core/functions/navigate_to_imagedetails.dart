import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pixels_app/Features/home/presentation/manager/image_cubit/cubit/image_cubit.dart';
import 'package:pixels_app/Features/home/presentation/view/widget/image_details.dart';
import 'package:pixels_app/Features/search/presentation/manager/search_cubit/cubit/search_cubit.dart';

void navigateToPreviewImage(
    BuildContext context, ImageSuccess state, int index) {
  Navigator.push(
    context,
    PageTransition(
      duration: const Duration(milliseconds: 250),
      type: PageTransitionType.scale,
      alignment: Alignment.bottomLeft,
      child: ImageDetails(
        imageUrl: state.images[index].imagePotraitPath,
        imageId: state.images[index].imageID,
      ),
    ),
  );
}

void navigateToPreviewImagee(
    BuildContext context, SearchSuccess state, int index) {
  Navigator.push(
    context,
    PageTransition(
      duration: const Duration(milliseconds: 250),
      type: PageTransitionType.scale,
      alignment: Alignment.bottomLeft,
      child: ImageDetails(
        imageUrl: state.images[index].imagePotraitPath,
        imageId: state.images[index].imageID,
      ),
    ),
  );
}
