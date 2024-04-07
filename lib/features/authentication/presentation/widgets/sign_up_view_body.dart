import 'package:bookly_app_with_mvvm/app/class/cache_helper.dart';
import 'package:bookly_app_with_mvvm/app/functions/show_snack_bar.dart';
import 'package:bookly_app_with_mvvm/config/extension.dart';
import 'package:bookly_app_with_mvvm/config/routes/routes.dart';
import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/signup_cubit/sign_up_cubit.dart';
import 'package:bookly_app_with_mvvm/features/authentication/presentation/manager/signup_cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constance.dart';
import 'logo_with_text.dart';
import 'button_with_is_login.dart';
import 'upper_text_field_with_text.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          CacheHelper.setData(key: token, value: state.userData.user?.uid).then((value) {
            if(value==true){
              context.navigateToReplacement(pageName: AppRoutes.loginSuccessRoute);
            }
          });

        } else if (state is SignUpErrorState) {
          showCustomSnackBar(context, state.mess);
        }
      },
      child: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kPadding),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LogoWithText(),
                  SignUPUpperTextFormWithText(),
                  SignUPButtonWithIsLogin()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
