import 'package:bookly_app_with_mvvm/core/utils/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'image_error.dart';

class MyCachedNetworkImage extends StatelessWidget {
  const MyCachedNetworkImage(
      {super.key,
      required this.imageUrl,
      this.height,
      this.width,
      this.boxFit});

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Container(
        color: ColorManager.grey300,
      ),
      errorWidget: (context, url, error) => const ImageError(),
      fit: boxFit ?? BoxFit.fill,
      height: height,
      width: width,
    );
  }
}
