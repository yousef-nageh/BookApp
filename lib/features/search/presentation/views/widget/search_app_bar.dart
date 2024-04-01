
import 'package:bookly_app_with_mvvm/config/extantion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../../core/utils/image_manager.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10,right: 10 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
              onPressed: () {
             context.popTo();
              },
              icon: const Icon(
                Icons.close,

              )),
          SvgPicture.asset(
            ImageManager.logo,
            height: 20,
          ),
        ],
      ),
    );
  }
}
