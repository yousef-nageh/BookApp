import 'package:flutter/material.dart';

import 'my_cached_network_image.dart';

class BookSmallImageItem extends StatelessWidget {
  const BookSmallImageItem({super.key, required this.imageLink});
final String imageLink;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: AspectRatio(
        aspectRatio: 0.7,
        child: MyCachedNetworkImage(imageUrl: imageLink,),
      ),
    );
  }
}
