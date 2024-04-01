import 'package:bookly_app_with_mvvm/features/details/presentation/views/widget/book_details_body.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';



class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.model});
  final BookEntity model;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body:BookDetailsBody(model: model,) ,
    );
  }
}
