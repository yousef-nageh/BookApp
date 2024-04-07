import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/config/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../../app/widget/is_login.dart';
import '../../../../core/utils/image_manager.dart';

import 'or_login_by.dart';

class LowerTextWithIcon extends StatelessWidget {
  const LowerTextWithIcon({super.key});

  static const List<String> images = [
    ImageManager.facebook,
    ImageManager.twitter,
    ImageManager.google,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.hR()),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                (index) => OrLoginBY(
                  onTap: () {},
                  imageUrl: images[index],
                  id: index,
                ),
              )),
        ),
        IsLogin(
          isLogin: false,
          goTo: () {
            (context).navigateToReplacement(
              pageName: AppRoutes.signUpViewRoute,
            );
          },
        )
      ],
    );
  }
}
