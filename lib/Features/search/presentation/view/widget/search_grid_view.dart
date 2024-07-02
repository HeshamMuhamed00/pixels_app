import 'package:flutter/cupertino.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      children: const [],
    );
  }
}
