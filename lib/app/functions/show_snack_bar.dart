import 'package:bookly_app_with_mvvm/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context,String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text,style: StyleManager.textStyle15,),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ));
  }