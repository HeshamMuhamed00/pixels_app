import 'package:flutter/material.dart';
import 'package:pixels_app/core/widget/bottom_nav_animated_icons.dart';
import 'package:pixels_app/Features/home/presentation/view/widget/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      bottomNavigationBar: BottomNavAnimatedIcons(),
      body: HomeViewBody(),
    );
  }
}
