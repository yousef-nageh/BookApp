import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/style_manager.dart';
import '../../../../../core/widget/my_button.dart';

import '../../../../home/domain/entities/book_entity.dart';

class MiddleButton extends StatelessWidget {
  const MiddleButton({super.key, required this.model});

  final BookEntity model;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w * 0.85,
      child: Row(
        children: [
          Expanded(
              child: MyButton(
            text: "free",
            onPressed: () {},
            buttonColor: Colors.white,
            style: StyleManager.textStyle15(context).copyWith(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 17),
            bottomLeft: 16,
            topLeft: 16,
          )),
          Expanded(
              child: MyButton(
            text: "Free preview",
            onPressed: () async {
              Uri uri = Uri.parse(model.previewLink);

              if (!await launchUrl(uri)) {
                throw 'Could not launch $uri';
              }
            },
            buttonColor: const Color(0xffEF8262),
            style:
                StyleManager.textStyle16(context).copyWith(fontWeight: FontWeight.bold),
            bottomRight: 16,
            topRight: 16,
          )),
        ],
      ),
    );
  }
}
