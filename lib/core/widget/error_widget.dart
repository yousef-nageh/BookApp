import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';
import 'package:bookly_app_with_mvvm/core/utils/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constance.dart';
import '../utils/style_manager.dart';

class ErrorText extends StatelessWidget {
  final String text;

  const ErrorText({super.key, required this.text});
  String getImage(){

    if(text==AppString.noInternet){
      return ImageManager.noNetwork;
    }
    return ImageManager.error;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(getImage(),
              height: size.height * 0.2, repeat: true, fit: BoxFit.fill),
          const SizedBox(
            height: kPadding,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Text(
              textAlign: TextAlign.center,
              text.toUpperCase(),
              style:
                  StyleManager.textStyle18(context).copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
