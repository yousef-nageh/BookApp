import 'package:bookly_app_with_mvvm/constance.dart';
import 'package:flutter/material.dart';

import 'waiting_books_item.dart';

class WaitingBooksList extends StatelessWidget {
  const WaitingBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return SizedBox(
        height: h * 0.3,
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
