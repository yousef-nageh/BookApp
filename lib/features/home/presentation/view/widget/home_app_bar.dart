
import 'package:bookly_app_with_mvvm/config/extantion.dart';
import 'package:bookly_app_with_mvvm/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../../core/utils/image_manager.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        SvgPicture.asset(ImageManager.logo,height: 20,),

        IconButton(onPressed: (){
          (context).navigateTo( pageName: AppRoutes.searchViewRoute);
        }, icon: const Icon(Icons.search_sharp,size: 30,))
      ],),
    );
  }
}
