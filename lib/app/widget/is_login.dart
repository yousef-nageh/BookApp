import 'package:bookly_app_with_mvvm/core/utils/color_manager.dart';
import 'package:bookly_app_with_mvvm/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class IsLogin extends StatelessWidget {
 final VoidCallback goTo;
  final bool isLogin;

  const IsLogin({super.key, required this.isLogin, required this.goTo});

  @override
  Widget build(BuildContext context) {

    return    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
         getText(),
          style: StyleManager.textStyle16(context),

        ),
        TextButton(
            onPressed: goTo,
            child:  Text(
              getButtonText(),
              style:StyleManager.textStyle18(context).copyWith(fontWeight: FontWeight.bold,color: ColorManager.blue),
            )),
      ],
    );
  }
  String getText(){
    if(isLogin){
      return "already have an account?";
    }else{
      return "don't have an account";
    }
  }
  String getButtonText(){
    if(isLogin){
      return "Login";
    }else{
      return "SignUp";
    }
  }
}
