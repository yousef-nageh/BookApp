
import 'package:bookly_app_with_mvvm/features/search/presentation/views/widget/text_form.dart';
import 'package:flutter/material.dart';



import 'Search_list.dart';
import 'search_app_bar.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   const SafeArea(
      child: Column (children: [
        SearchAppBar(),
        TextForm(),

        Expanded(child: SearchList()),
      ],),
    );
  }
}