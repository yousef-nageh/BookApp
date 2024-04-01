
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/routes/routes.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitial());

  var signUpFormKey = GlobalKey<FormState>();
  bool signUpObscureText = true;
  IconData signUPIcon = Icons.visibility_off;

  void showSignUpPassword() {
    signUpObscureText = !signUpObscureText;
    signUpObscureText ? signUPIcon = Icons.visibility_off : signUPIcon =
        Icons.visibility;
    emit(SignUpChangeIconState());
  }

  void checkAndGoLogin(context) {
    if (signUpFormKey.currentState?.validate() == true) {
      Navigator.pushReplacementNamed(context, AppRoutes.loginViewRoute);

    }
  }


}
