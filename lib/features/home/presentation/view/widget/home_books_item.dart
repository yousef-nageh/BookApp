
import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



import '../../../../../app/widget/image_error.dart';



class BooksItem extends StatelessWidget {

  final BookEntity model;

  const BooksItem({super.key,  required this.model});

  @override
  Widget build(BuildContext context) {

    return Hero(

      tag: model.bookId,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 30.hR(),
          child: AspectRatio(
            aspectRatio: 1.3 / 2,
            child: CachedNetworkImage(

              fit: BoxFit.fill,
              imageUrl: model.image,
              errorWidget: (context, url, error) =>
              const ImageError(borderRadius: 20,),
            ),
          ),
        ),
      ),
    );
  }
}
