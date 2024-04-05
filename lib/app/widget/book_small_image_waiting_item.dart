import 'package:flutter/material.dart';

import 'shimmer_rectangle_widget.dart';

class BookSmallImageWaitingItem extends StatelessWidget {
  const BookSmallImageWaitingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: const AspectRatio(aspectRatio: 0.7,
          child: ShimmerRectangleWidget(height:120,width: 80 ,)),
    );
  }
}
