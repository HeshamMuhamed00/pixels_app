import 'package:flutter/material.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/custom_text_form_feild.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_ideas_category.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_populer_category.dart';
import 'package:pixels_app/core/functions/navigate_to_search_result.dart';

class SearchCategoriesViewBody extends StatelessWidget {
  final TextEditingController _textEditingController;

  SearchCategoriesViewBody({super.key, required String query})
      : _textEditingController = TextEditingController(text: query);

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
                controller: _textEditingController,
                onSubmitted: (query) {
                  navigateToSearchResult(context, query);
                },
                hintText: 'Search for photo',
                prefixIcon: IconButton(
                  onPressed: () {
                    final query = _textEditingController.text;

                    navigateToSearchResult(context, query);
                  },
                  icon: const Icon(Icons.search),
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
                'Popular on pixels',
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
