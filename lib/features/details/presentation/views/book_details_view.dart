
import 'package:flutter/material.dart';

import '../../../home/domain/entities/book_entity.dart';
import 'widget/book_details_body.dart';
import 'widget/books_details_app_bar.dart';



class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.model});
  final BookEntity model;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
         automaticallyImplyLeading: false,
        title: const BooksDetailsAppBar(),
      ),
      body:BookDetailsBody(model: model,) ,
    );
  }
}
