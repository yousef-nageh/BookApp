

import 'package:flutter/material.dart';


import 'button_with_driver.dart';
import 'logo_with_text.dart';
import 'lower_text_with_icon.dart';
import 'middle_text_with_check_box.dart';
import 'upper_text_form_with_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return  const SafeArea(
      child:  Center(
        child: SingleChildScrollView(
          physics:  PageScrollPhysics(),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LogoWithText(),
                 UpperTextFormWithText(),
                MiddleTextWithCheckBox(),


                ButtonWithDriver(),

                LowerTextWithIcon()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
