
import 'package:flutter/material.dart';


class BooksDetailsAppBar extends StatelessWidget {
  const BooksDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        IconButton(onPressed: (){
       Navigator.of(context).pop();
        }, icon: const Icon(Icons.close)),

        IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart)),

      ],),
    );
  }
}


