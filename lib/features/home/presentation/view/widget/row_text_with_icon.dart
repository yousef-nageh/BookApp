import 'package:flutter/material.dart';

import '../../../../../core/utils/style_manager.dart';

class RowTextWithIcon extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;

  const RowTextWithIcon(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          " 4.8 ",
          style: StyleManager.textStyle16,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          " (2390) ",
          style: StyleManager.textStyle14(context),
        ),
      ],
    );
  }
}
