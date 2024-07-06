import 'package:flutter/material.dart';
import 'package:pixels_app/Features/home/presentation/view/home_view.dart';
import 'package:pixels_app/Features/search/presentation/view/search_view.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_view_body.dart';
import 'bottom_nav_animated_icons.dart'; // Adjust the import based on your file structure

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeView(),
    SearchView(),
    SearchViewBody(), // Add other pages here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavAnimatedIcons(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
