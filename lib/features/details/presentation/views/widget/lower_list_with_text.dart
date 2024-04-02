import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';
import 'package:bookly_app_with_mvvm/core/utils/constance.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/style_manager.dart';
import 'books_lower_list.dart';

class LowerListWithText extends StatelessWidget {
  final Widget child;
  const LowerListWithText({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: kPadding),
          child: Text(
            AppString.youCanAlsoLike,style:StyleManager.textStyle14(context).copyWith(fontSize: 16) ,),
        ),
       child,
        const BooksLowerList(),

      ],
    );
  }
}
