
import 'package:bookly_app_with_mvvm/config/extantion.dart';
import 'package:bookly_app_with_mvvm/config/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/image_manager.dart';
import '../../../../../core/widget/is_login.dart';
import 'or_login_by.dart';

class LowerTextWithIcon extends StatelessWidget {
  const LowerTextWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    return  Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical:h * 0.02 ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              OrLoginBY(onTap: (){}, imageUrl: ImageManager.facebook, id: 1,),
              OrLoginBY(onTap: (){}, imageUrl: ImageManager.twitter, id: 2,),
              OrLoginBY(onTap: (){}, imageUrl: ImageManager.google, id: 3,),


            ],),
        ),
        IsLogin(isLogin: false, goTo: () {
         (context).navigateTo( pageName: AppRoutes.signUpViewRoute,);
        },)
      ],
    );
  }
}
