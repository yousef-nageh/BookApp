import 'package:bookly_app_with_mvvm/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  const MyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return   Column(

      children: [
        Align(
          alignment: Alignment.topLeft,
            child: Text(text,style: StyleManager.textStyle16.copyWith(fontWeight: FontWeight.bold),))
      ],
    );
  }
}
