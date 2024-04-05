import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constance.dart';
import 'waiting_books_lower_item.dart';

class WaitingBooksLowerList extends StatelessWidget {
  const WaitingBooksLowerList({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 15.hR(),
      child: ListView.separated(
        padding:const EdgeInsets.symmetric(horizontal: kPadding),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => const WaitingBooksLowerItem(

        ),
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(
          width: 10,
        ),
        itemCount: 10,
      ),
    );
  }
}
