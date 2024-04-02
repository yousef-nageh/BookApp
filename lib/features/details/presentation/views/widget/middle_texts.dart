import 'package:bookly_app_with_mvvm/features/home/presentation/view/widget/row_text_with_icon.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constance.dart';
import '../../../../../core/utils/style_manager.dart';

import '../../../../home/domain/entities/book_entity.dart';

class MiddleTexts extends StatelessWidget {
  const MiddleTexts({super.key,required this.model});
  final BookEntity model;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        children: [
           Text(
            textAlign:TextAlign.center,
             model.title,style: StyleManager.textStyle30(context).copyWith(fontFamily: kGTFont),
          ),
          const SizedBox(height: 8,),
          Text(model.publisher,style: StyleManager.textStyle18(context).copyWith(color: Colors.grey),),
          const SizedBox(height: 8,),
        const RowTextWithIcon(mainAxisAlignment: MainAxisAlignment.center),
        ],
      ),
    );
  }
}
