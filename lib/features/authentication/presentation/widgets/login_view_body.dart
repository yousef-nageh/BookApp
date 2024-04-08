import 'package:bookly_app_with_mvvm/app/functions/show_snack_bar.dart';
import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/config/routes/routes.dart';
import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/class/cache_helper.dart';
import '../../../../core/utils/constance.dart';
import 'button_with_driver.dart';
import 'logo_with_text.dart';
import 'lower_text_with_icon.dart';
import 'middle_text_with_check_box.dart';
import 'upper_text_form_with_text.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LongInSuccessState) {
          CacheHelper.setData(key: token, value: state.userData.user?.uid).then(
            (value) {
              if (value == true) {
                context.navigateToReplacement(
                    pageName: AppRoutes.loginSuccessRoute);
              }
            },
          );
        } else if (state is LongInErrorState) {
          showCustomSnackBar(context, state.mess);
        }
      },
      child: const SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: PageScrollPhysics(),
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
      ),
    );
  }
}
