import 'package:flutter/material.dart';
import 'package:pixels_app/home/presentation/view/widget/custom_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(child: CustomGridView());
  }
}
