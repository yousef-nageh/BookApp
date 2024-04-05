import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../app/widget/book_small_image_waiting_item.dart';
import '../../../../../app/widget/shimmer_rectangle_widget.dart';
import '../../../../../core/utils/constance.dart';


class WaitingLowerItem extends StatelessWidget {
  const WaitingLowerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:   const EdgeInsets.symmetric(horizontal: kPadding),
      child: SizedBox(
        height: 15.hR(),
        child:  const Row(
          children: [
            BookSmallImageWaitingItem(),
             Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerRectangleWidget(),
                    SizedBox(height: 10,),

                    ShimmerRectangleWidget(),
                    SizedBox(height: 10,),

                    ShimmerRectangleWidget(),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ShimmerRectangleWidget(width: 30,),
                        ShimmerRectangleWidget(width: 60,),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
