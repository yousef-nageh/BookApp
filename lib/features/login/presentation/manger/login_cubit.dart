

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/routes.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
  IconData loginIcon = Icons.visibility_off;
  var loginFormKey = GlobalKey<FormState>();

  bool loginObscureText = true;

  bool checkBoxValue = false;

  void setCheckBoxValue(bool? value) {
    checkBoxValue = value ?? true;
    emit(CheckBoxState());
  }

  void showLoginPassword() {
    loginObscureText = !loginObscureText;
    loginObscureText ? loginIcon = Icons.visibility_off : loginIcon =
        Icons.visibility;
    emit(LongInChangeIconState());
  }



  void checkAndGoHome(context) {
    if (loginFormKey.currentState?.validate() == true) {
      //context.navigateToReplacement(pageName: AppRoutes.homeViewRoute);
      Navigator.pushReplacementNamed(context, AppRoutes.homeViewRoute);
    }
  }



}
