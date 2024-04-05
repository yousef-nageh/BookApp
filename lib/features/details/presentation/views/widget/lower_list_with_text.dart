
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/constance.dart';
import '../../../../../core/utils/style_manager.dart';

import 'details_books_block_builder.dart';

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
        const DetailsBooksBlockBuilder(),

      ],
    );
  }
}
