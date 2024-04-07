
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constance.dart';
import '../../../../home/presentation/view/widget/lower_books_item.dart';
import '../../manager/search_home_cubit/search_cubit.dart';
import '../../manager/search_home_cubit/search_state.dart';


class SearchList extends StatelessWidget {
  const SearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (BuildContext context, state) {
        SearchCubit cubit =SearchCubit.instance(context);
          return ListView.separated(
            padding:const EdgeInsets.symmetric(vertical: kPadding),
            controller: cubit.controller,

            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              if (index<cubit.searchBooks.length) {
                return LowerBooksItem(model:  cubit.searchBooks[index] );
              }else{

              return  const SizedBox();
              }
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 20,
            ),
            itemCount: cubit.searchBooks.length+1,
          );

      },
    );
  }
}
