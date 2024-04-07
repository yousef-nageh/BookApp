import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/core/utils/image_manager.dart';
import 'package:bookly_app_with_mvvm/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/utils/app_string.dart';

class LoginSuccessBody extends StatefulWidget {
  const LoginSuccessBody({super.key});

  @override
  State<LoginSuccessBody> createState() => _LoginSuccessBodyState();
}

class _LoginSuccessBodyState extends State<LoginSuccessBody>with SingleTickerProviderStateMixin {

  late AnimationController animationController;

void setupAnimation(){
  animationController=AnimationController(vsync: this);
  animationController.addStatusListener((status) {

    if(status == AnimationStatus.completed){
      context.navigateToReplacement(pageName: AppRoutes.homeViewRoute);
      animationController.reset();
    }
  });
}
  @override
  void initState() {
    super.initState();
    setupAnimation();
  }
@override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.asset(ImageManager.loginSuccessImage,
        controller: animationController,
          onLoaded: (composition){
            animationController.duration=composition.duration;
          animationController.forward();


          },

        ),
        Text(
          textAlign: TextAlign.center,
          AppString.loginSuccess,

          style: StyleManager.textStyle20,
        )
      ],
    );
  }
}
