import 'package:flutter/cupertino.dart';

import '../../../../../core/widget/shimmer_rectangle_widget.dart';

class WaitingBooksItem extends StatelessWidget {
  const WaitingBooksItem({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return  SizedBox(
        height: h * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const AspectRatio(
          aspectRatio: 1.3 / 2,
          child:ShimmerRectangleWidget()
    ),
        ));
  }
}
