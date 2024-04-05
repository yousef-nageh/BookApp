
import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../app/widget/book_small_image_item.dart';

class BooksLowerItem extends StatelessWidget {
  const BooksLowerItem({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 15.hR(),
      child: BookSmallImageItem(imageLink: imageUrl,),
    );
  }
}
