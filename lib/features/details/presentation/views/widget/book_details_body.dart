

import 'package:flutter/material.dart';


import '../../../../../app/widget/height_size_box.dart';
import '../../../../../core/utils/constance.dart';
import '../../../../home/domain/entities/book_entity.dart';
import '../../../../home/presentation/view/widget/home_books_item.dart';

import 'lower_list_with_text.dart';
import 'middle_text_and_button.dart';

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

                BooksItem(
                  model: model,
                ),
                const HeightSizeBox(height: 2,),
                MiddleTextAndButton(
                  model: model,
                  child: const HeightSizeBox(height: 3,),
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
