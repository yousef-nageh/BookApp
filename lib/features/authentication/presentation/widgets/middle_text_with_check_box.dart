import 'package:flutter/material.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/style_manager.dart';
import 'check_box_with_text.dart';

class MiddleTextWithCheckBox extends StatelessWidget {
  const MiddleTextWithCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    return  Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: h * 0.02, bottom: h * 0.01),
          child: Align(
              alignment: Alignment.topRight,
              child: TextButton(onPressed: () {  }, child: Text(
                AppString.forgotPassword,
                style: StyleManager.textStyle16(context)
                    .copyWith(fontWeight: FontWeight.bold,color: ColorManager.blue),
              ),)),
        ),
        const CheckBoxWIthText(),
      ],
    );
  }
}
