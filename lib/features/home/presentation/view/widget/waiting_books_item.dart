import 'package:bookly_app_with_mvvm/config/extantion.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../app/widget/shimmer_rectangle_widget.dart';



class WaitingBooksItem extends StatelessWidget {
  const WaitingBooksItem({super.key});

  @override
  Widget build(BuildContext context) {

    return  SizedBox(
        height: 30.hR(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const AspectRatio(
          aspectRatio: 1.3 / 2,
          child:ShimmerRectangleWidget()
    ),
        ));
  }
}
