

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerRectangleWidget extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerRectangleWidget({super.key,  this.width=double.infinity,  this.height=10});

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor:  Colors.grey.shade200,
      child: Container(
        color: Colors.grey,
        width: width,
        height:height ,
      ),
    );
  }
}
