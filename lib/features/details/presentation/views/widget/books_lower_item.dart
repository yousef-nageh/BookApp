
import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/features/details/presentation/manager/book_details_cubit/book_details_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../app/widget/book_small_image_item.dart';
import '../../../../home/domain/entities/book_entity.dart';

class BooksLowerItem extends StatelessWidget {
  const BooksLowerItem({super.key, required this.model});
  final BookEntity model;

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 15.hR(),
      child: InkWell(
          onTap: (){
            BookDetailsCubit.instance(context).showBook(context, model.previewLink);
          },
          child: BookSmallImageItem(imageLink: model.image,)),
    );
  }
}
