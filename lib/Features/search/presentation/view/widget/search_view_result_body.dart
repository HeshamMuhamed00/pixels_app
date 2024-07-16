import 'package:flutter/material.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/custom_text_form_feild.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/search_grid_view.dart';

class SearchViewResultBody extends StatefulWidget {
  const SearchViewResultBody({super.key});

  @override
  State<SearchViewResultBody> createState() => _SearchViewResultBodyState();
}

class _SearchViewResultBodyState extends State<SearchViewResultBody> {
  bool _isVisible = true;
  final TextEditingController _textEditingController = TextEditingController();
  String _query = '';

  void _onSearchSubmitted(String query) {
    setState(() {
      _query = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return notificationScrollListener(context);
  }

  NotificationListener<ScrollNotification> notificationScrollListener(
      BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          if (notification.scrollDelta! > 0 && _isVisible) {
            setState(() {
              _isVisible = false;
            });
          } else if (notification.scrollDelta! < 0 && !_isVisible) {
            setState(() {
              _isVisible = true;
            });
          }
        }
        return true;
      },
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: _isVisible ? 60 : 0,
              child: _isVisible
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: CustomTextFeild(
                              hintText: 'Search pixels',
                              prefixIcon: IconButton(
                                onPressed: () {
                                  _onSearchSubmitted(
                                      _textEditingController.text);
                                },
                                icon: const Icon(Icons.search),
                              ),
                              controller: _textEditingController,
                              onSubmitted: _onSearchSubmitted,
                            ),
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 14,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: SearchGridView(query: _query),
          ),
        ],
      ),
    );
  }
}
