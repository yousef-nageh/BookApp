
import 'package:bookly_app_with_mvvm/config/extantion.dart';
import 'package:bookly_app_with_mvvm/core/utils/style_manager.dart';

import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_mvvm/features/home/presentation/view/widget/row_text_with_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../../../../../config/routes/routes.dart';
import '../../../../../core/utils/constance.dart';
import '../../../../../core/widget/image_error.dart';

class LowerBooksItem extends StatelessWidget {
  const LowerBooksItem({
    super.key,
    required this.model,
  });

  final BookEntity model;

  @override
  Widget build(BuildContext context) {
    double h=context.getHeight();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: SizedBox(
        height: h*0.15,
        child: InkWell(
          onTap: () {
            context.navigateTo(arguments:model, pageName: AppRoutes.bookDetailsViewRoute );
          },
          child: Row(
            children: [
              Hero(
                tag: model.bookId,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                    height: h*0.15,
                    width:  h*0.15*0.75,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) => const ImageError(
                        borderRadius: 20,
                      ),
                      imageUrl: model.image,
                    ),
                  ),
                ),
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
                      style: StyleManager.textStyle20(context).copyWith(fontFamily: kGTFont,height: 1.3)
                    ),

                    Text(
                      maxLines: 1,
                      model.bookAuthors[0],
                      style: StyleManager.textStyle14(context),
                    ),

                     Row(

                      children: [
                        Text(
                          "free ",
                          style: StyleManager.textStyle15(context),
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
  // String getAuthors(){
  //   if(model?.authors?.isEmpty==true){
  //     return( model?.publisher??"").toString();
  //   }else{
  //     return ( model?.authors?[0]).toString();
  //   }
  // }
}
