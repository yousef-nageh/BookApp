import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../app/functions/show_snack_bar.dart';
import '../../../../../app/widget/my_button.dart';
import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/style_manager.dart';


import '../../../../home/domain/entities/book_entity.dart';

class MiddleButton extends StatelessWidget {
  const MiddleButton({super.key, required this.model});

  final BookEntity model;
void buttonFunction(BuildContext context) async{
  Uri uri = Uri.parse(model.previewLink);

  !await launchUrl(uri).catchError((error){
    showCustomSnackBar(context,AppString.couldNotLaunch);
 return false;
  });




}
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 85.wR(),
      child: Row(
        children: [
          Expanded(
              child: MyButton(
            text: AppString.free,
            onPressed: () {},
            buttonColor: Colors.white,
            style: StyleManager.textStyle15.copyWith(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 17),
            bottomLeft: 16,
            topLeft: 16,
          )),
          Expanded(
              child: MyButton(
            text: AppString.freePreview,
            onPressed: () async {
              buttonFunction(context);
            },
            buttonColor: const Color(0xffEF8262),
            style:
                StyleManager.textStyle16.copyWith(fontWeight: FontWeight.bold),
            bottomRight: 16,
            topRight: 16,
          )),
        ],
      ),
    );
  }
}
