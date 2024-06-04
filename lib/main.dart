import 'package:flutter/material.dart';
import 'package:pixels_app/core/utils/app_router.dart';

void main() {
  runApp(const PixelsApp());
}

class PixelsApp extends StatelessWidget {
  const PixelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
