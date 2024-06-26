

import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';
import 'package:bookly_app_with_mvvm/core/utils/style_manager.dart';

import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_mvvm/features/home/presentation/view/widget/row_text_with_icon.dart';

import 'package:flutter/material.dart';



import '../../../../../app/widget/book_small_image_item.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/constance.dart';


class LowerBooksItem extends StatelessWidget {
  const LowerBooksItem({
    super.key,
    required this.model,
  });

  final BookEntity model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: SizedBox(
        height: 15.hR(),
        child: InkWell(
          onTap: () {
            context.navigateTo(arguments:model, pageName: AppRoutes.bookDetailsViewRoute );
          },
          child: Row(
            children: [
              Hero(

                tag: model.bookId,
                child: BookSmallImageItem(imageLink: model.image,)
              ),
              const SizedBox(width: 30,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(

                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      (model.title).toString(),
                      style: StyleManager.textStyle20.copyWith(fontFamily: kGTFont,height: 1.3)
                    ),

                    Text(
                      maxLines: 1,
                      model.bookAuthors[0],
                      style: StyleManager.textStyle14(context),
                    ),

                     Row(

                      children: [
                        Text(
                         AppString.free,
                          style: StyleManager.textStyle15,
                        ),
                        const Spacer(),
                        const RowTextWithIcon(),

                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
