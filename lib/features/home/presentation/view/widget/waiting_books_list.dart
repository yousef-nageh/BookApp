import 'package:bookly_app_with_mvvm/config/extantion.dart';
import 'package:bookly_app_with_mvvm/core/utils/constance.dart';
import 'package:flutter/material.dart';

import 'waiting_books_item.dart';

class WaitingBooksList extends StatelessWidget {
  const WaitingBooksList({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        height:30.hR(),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),

          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) =>const WaitingBooksItem(),
          separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(
            width: 20,
          ),
          itemCount: 5,));
  }
}
