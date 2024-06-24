import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pixels_app/home/presentation/manager/image_cubit/cubit/image_cubit.dart';
import 'package:pixels_app/home/presentation/view/widget/image_details.dart';

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
