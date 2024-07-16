import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixels_app/Features/search/presentation/manager/search_by_query_cubit/search_by_query_cubit.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/custom_text_form_feild.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_ideas_category.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_populer_category.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_view_result.dart';

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
                    debugPrint(
                        'Search icon pressed, query: $query'); // Debugging line
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

  void navigateToSearchResult(BuildContext context, String query) {
    query = query.trim(); // Trim whitespace
    debugPrint('Query: $query'); // Debugging line to print the query
    if (query.isNotEmpty) {
      try {
        BlocProvider.of<SearchByQueryCubit>(context)
            .fetchImagesBySearch(query: query);
        debugPrint('Bloc fetchImagesBySearch called'); // Debugging line
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchViewResult(query: query),
          ),
        );
        debugPrint('Navigating to SearchViewResult'); // Debugging line
      } catch (e) {
        debugPrint('Error: $e'); // Print any errors
      }
    } else {
      // Optionally show a message if the query is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a search query')),
      );
    }
  }
}
