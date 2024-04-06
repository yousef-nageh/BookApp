import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';
import 'package:bookly_app_with_mvvm/core/utils/color_manager.dart';
import 'package:bookly_app_with_mvvm/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/widget/no_internet_widget.dart';

import '../../manager/search_home_cubit/search_cubit.dart';
import '../../manager/search_home_cubit/search_state.dart';
import 'Search_list.dart';
import 'waiting_search_list.dart';

class SearchBooksBlockBuilder extends StatelessWidget {
  const SearchBooksBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SearchCubit, SearchState>(
      builder: (BuildContext context, state) {
        if (state is SearchSuccessState || state is SearchPaginationWaitingState) {
          if(SearchCubit.instance(context).searchBooks.isEmpty){
           return  Center(child: Text(AppString.noItemFound,style: StyleManager.textStyle20.copyWith(color: ColorManager.white),));
          }
          return const SearchList();
        } else if (state is SearchErrorState) {

          return  NoInternetWidget(text: state.errorMassage, onPressed: () {  },);

        } else if(state is SearchWaitingState){
          return const WaitingSearchList();
        }else{
          return const SizedBox(height: 0,);
        }
      },
    );
  }
}
