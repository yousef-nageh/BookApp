import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrLoginBY extends StatelessWidget {
  final Function() onTap;
 final int id;
  final String imageUrl;
  const OrLoginBY({super.key, required this.onTap, required this.imageUrl, required this.id});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      heroTag: id,



        onPressed: onTap,

        child: SvgPicture.asset(imageUrl,width: 20,height: 20, ));
  }
}