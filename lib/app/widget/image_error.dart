import 'package:flutter/material.dart';

class ImageError extends StatelessWidget {
  const ImageError({super.key, required this.borderRadius});
final double borderRadius;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return   Container(
        height: h * 0.3,
        decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: const Center(child: Icon(Icons.error,size: 30,color: Colors.black,)));
  }
}
