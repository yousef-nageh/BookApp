import 'package:bookly_app_with_mvvm/core/utils/constance.dart';
import 'package:bookly_app_with_mvvm/features/details/presentation/views/widget/middle_text_and_button.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';

import 'package:flutter/material.dart';


import '../../../../home/presentation/view/widget/home_books_item.dart';
import 'books_details_app_bar.dart';
import 'lower_list_with_text.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.model});

  final BookEntity model;

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(


      physics: const PageScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(
                top: kPadding, bottom: 50, ),
            child: Column(
              children: [
                const BooksDetailsAppBar(),
                BooksItem(
                  model: model,
                ),
                const SizedBox(
                  height: 35,
                ),
                MiddleTextAndButton(
                  model: model,
                  child: const SizedBox(
                    height: 37,
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 51,
                  ),
                ),
                const LowerListWithText(
                  child: SizedBox(
                    height: 15,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
