import 'package:flutter/material.dart';
import 'package:pixels_app/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const PixelsApp());
}

class PixelsApp extends StatelessWidget {
  const PixelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashView());
  }
}
