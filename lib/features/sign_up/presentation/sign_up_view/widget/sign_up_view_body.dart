import 'package:flutter/material.dart';

import '../../../../../constance.dart';
import '../../../../login/presentation/views/widget/logo_with_text.dart';
import 'button_with_is_login.dart';
import 'upper_text_field_with_text.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kPadding),
        child: Center(
          child: SingleChildScrollView(
            child:  Column(
              children: [
                LogoWithText(),
                SignUPUpperTextFormWithText(),
                SignUPButtonWithIsLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
