import 'package:bookly_app_with_mvvm/core/utils/image_manager.dart';
import 'package:bookly_app_with_mvvm/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'my_elevated_button.dart';


class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Lottie.asset(ImageManager.noNetwork),
            Text(
              textAlign: TextAlign.center, text, style: StyleManager.textStyle20,),
            Padding(
              padding: const EdgeInsets.all(20),

              child: MyElevatedButton(onPressed: onPressed, text: "Try Again"),
            )
          ],
        ),
      ),
    );
  }
}
