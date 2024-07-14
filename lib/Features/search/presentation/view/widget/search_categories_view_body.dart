import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/custom_text_form_feild.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_ideas_category.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_populer_category.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_view_result.dart';

class SearchCategoriesViewBody extends StatelessWidget {
  const SearchCategoriesViewBody({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: true,
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const SizedBox(
                height: 50,
              ),
              CustomTextFeild(
                hintText: 'Search for photo',
                prefixIcon: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchViewResult(
                          query: query,
                        ),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.search_outlined,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Ideas for you',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              const SearchGridIdeasCategory(),
              const SizedBox(
                height: 30,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Populer on pixels',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 14,
              ),
              const SearchGridPopulerCategory(),
            ],
          ),
        ),
      ],
    );
  }
}
