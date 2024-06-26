import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pixels_app/Features/home/presentation/view/widget/arrow_back_image_details.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails(
      {super.key, required this.imageUrl, required this.imageId});

  final String imageUrl;
  final int imageId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SafeArea(
            child: ArrowBackImageDetails(),
          ),
        ],
      ),
    );
  }
}
