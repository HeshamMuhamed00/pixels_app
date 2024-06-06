import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageDetails extends StatelessWidget {
  const ImageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.asset('assets/pexels.jpg'));
  }
}
