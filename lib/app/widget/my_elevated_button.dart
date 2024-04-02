import 'package:bookly_app_with_mvvm/core/utils/color_manager.dart';
import 'package:bookly_app_with_mvvm/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const MyElevatedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: StyleManager.textStyle18
              .copyWith(color: ColorManager.black, fontWeight: FontWeight.bold),
        ));
  }
}
