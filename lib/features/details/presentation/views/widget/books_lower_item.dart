import 'package:flutter/material.dart';

class BooksLowerItem extends StatelessWidget {
  const BooksLowerItem({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return    Container(
      height: 120,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image:  DecorationImage(
              image: NetworkImage(imageUrl),

              fit: BoxFit.fill)),
    );
  }
}
