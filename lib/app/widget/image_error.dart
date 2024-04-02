import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class ImageError extends StatelessWidget {
  const ImageError({super.key, });

  @override
  Widget build(BuildContext context) {

    return  Icon(Icons.info_outline,
    size: 5.wR(),
      color: ColorManager.red,
    );
  }
}
