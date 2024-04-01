
import 'package:bookly_app_with_mvvm/features/details/presentation/views/widget/books_lower_item.dart';
import 'package:bookly_app_with_mvvm/features/home/presentation/manger/lower_list_block/lower_list_cubit.dart';
import 'package:bookly_app_with_mvvm/features/home/presentation/manger/lower_list_block/lower_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constance.dart';

class BooksLowerList extends StatelessWidget {
  const BooksLowerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LowerListCubit, LowerListStates>(
      builder: (BuildContext context, state) {
        if (state is GetLowerListSuccessState) {
          return SizedBox(
            height: 120,
            child: ListView.separated(
              padding:const EdgeInsets.symmetric(horizontal: kPadding),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => BooksLowerItem(
                imageUrl: state.lowerBooks[index].image,


              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 10,
              ),
              itemCount: state.lowerBooks.length,
            ),
          );
        } else {
          return const SizedBox(height: 0,);
        }
      },
    );
  }
}
