import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pixels_app/home/presentation/view/widget/arrow_back_image_details.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/pexels.jpg',
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
