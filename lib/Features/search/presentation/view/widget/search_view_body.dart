import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pixels_app/Features/search/presentation/view/widget/custom_text_form_feild.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(width: 14), // A
              Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              // Added space between the Icon and CustomTextFormField
              Expanded(
                child: CustomTextFormFeild(
                  hintText: 'Search pixels',
                  prefixIcon: Icon(Icons.search_outlined),
                ),
              ),
            ],
          ),
          Center(
            child: Text('Hello'),
          )
        ],
      ),
    );
  }
}
