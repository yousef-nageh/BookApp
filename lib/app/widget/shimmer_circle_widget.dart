
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCircleWidget extends StatelessWidget {
  final double radius;

  const ShimmerCircleWidget({super.key,  this.radius=20});

  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: CircleAvatar(
      radius:radius ,
      ),
    );
  }
}
