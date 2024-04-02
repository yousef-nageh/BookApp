import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/style_manager.dart';
import 'check_box_with_text.dart';

class MiddleTextWithCheckBox extends StatelessWidget {
  const MiddleTextWithCheckBox({super.key});

  @override
  Widget build(BuildContext context) {

    return  Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.hR(), bottom: 1.hR()),
          child: Align(
              alignment: Alignment.topRight,
              child: TextButton(onPressed: () {  }, child: Text(
                AppString.forgotPassword,
                style: StyleManager.textStyle16
                    .copyWith(fontWeight: FontWeight.bold,color: ColorManager.blue),
              ),)),
        ),
        const CheckBoxWIthText(),
      ],
    );
  }
}
