import 'package:bookly_app_with_mvvm/features/authentication/data/repositories/authentication_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.authenticationRepo) : super(LoginInitial());
  AuthenticationRepo authenticationRepo;

  static LoginCubit instance(BuildContext context) => BlocProvider.of(context);
  var emailData = TextEditingController();
  var passwordData = TextEditingController();
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


  void checkAndGoHome() {
    if (loginFormKey.currentState?.validate() == true) {
      userLogin(email: emailData.text,password:passwordData.text );
    }
  }

  Future<void> userLogin(
      {required String email, required String password}) async {
    emit(LongInWaitingState());
    var result = await authenticationRepo.userLogin(
        email: email, password: password);
    result.fold((error) => emit(LongInErrorState(error.errorMessage)), (data) =>
        emit(LongInSuccessState(data)));
  }


}
