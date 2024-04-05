


import 'package:bookly_app_with_mvvm/config/extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constance.dart';


import '../../manager/book_details_cubit/book_details_cubit.dart';
import '../../manager/book_details_cubit/book_details_state.dart';
import 'books_lower_item.dart';

class BooksLowerList extends StatelessWidget {
  const BooksLowerList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsStates>(
      builder: (BuildContext context, state) {
        BookDetailsCubit cubit =BookDetailsCubit.instance(context);

          return SizedBox(
            height: 15.hR(),
            child: ListView.separated(
              padding:const EdgeInsets.symmetric(horizontal: kPadding),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => BooksLowerItem(
                imageUrl: cubit.bookList[index].image,


              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 10,
              ),
              itemCount: cubit.bookList.length,
            ),
          );

      },
    );
  }
}
