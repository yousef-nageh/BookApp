
import 'package:bookly_app_with_mvvm/config/extantion.dart';
import 'package:bookly_app_with_mvvm/config/routes/routes.dart';
import 'package:bookly_app_with_mvvm/core/utils/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';





class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  
  @override
  void initState() {
    super.initState();
    startAnimation();
    navigateToHome();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(ImageManager.logo,width: w*0.8,),
      const SizedBox(height: 8,),
      SlideTransition(
        position: slidingAnimation,
        child: const Text(textAlign:TextAlign.center ,
            "Read Free Book"),
      )
      ],
    );
  }
  void startAnimation(){
    animationController=AnimationController(vsync: this,duration: const Duration(seconds: 1));
    slidingAnimation=Tween<Offset>(begin:const Offset(0,5),end: Offset.zero).animate(animationController);
    animationController.reset();
    animationController.forward();
  }
  void navigateToHome(){
    Future.delayed(const Duration(seconds: 2),(){
      if(mounted) {
       context.navigateToReplacement(pageName: AppRoutes.loginViewRoute);
      }
    });
  }
}
