import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:pixels_app/splash/presentation/view/splash_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const PixelsApp(),
    ),
  );
}

class PixelsApp extends StatelessWidget {
  const PixelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      home: const SplashView(),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
    );
  }
}
