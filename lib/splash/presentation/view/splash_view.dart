import 'package:flutter/material.dart';
import 'package:pixels_app/splash/presentation/view/widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Expanded(child: SplashViewBody()),
    );
  }
}
