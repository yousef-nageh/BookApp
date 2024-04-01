import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';


import 'middle_button.dart';
import 'middle_texts.dart';

class MiddleTextAndButton extends StatelessWidget {
  final Widget child;
  const MiddleTextAndButton({super.key, required this.child, required this.model});
  final BookEntity model;

  @override
  Widget build(BuildContext context) {
    return Column (children: [
       MiddleTexts(model: model,),
     child,
       MiddleButton(model: model,),
    ],);
  }
}
