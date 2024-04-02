import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';
import 'package:bookly_app_with_mvvm/core/utils/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/constance.dart';
import '../../core/utils/style_manager.dart';


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

    return SizedBox(
      width: double.infinity,
      height: 40.hR(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(getImage(),
              height: 20.hR(), repeat: true, fit: BoxFit.fill),
          const SizedBox(
            height: kPadding,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Text(
              textAlign: TextAlign.center,
              text.toUpperCase(),
              style:
                  StyleManager.textStyle18.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
