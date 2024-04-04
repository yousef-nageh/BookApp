import 'package:bookly_app_with_mvvm/app/widget/my_cached_network_image.dart';
import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:flutter/material.dart';

class BooksLowerItem extends StatelessWidget {
  const BooksLowerItem({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 12.hR(),
      child: AspectRatio(

        aspectRatio: 0.8,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: MyCachedNetworkImage(imageUrl: imageUrl)),
      ),
    );
  }
}
