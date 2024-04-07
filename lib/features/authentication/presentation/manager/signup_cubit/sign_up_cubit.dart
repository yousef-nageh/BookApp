import 'package:bookly_app_with_mvvm/features/authentication/data/repositories/authentication_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this.authenticationRepo) : super(SignUpInitial());
  AuthenticationRepo authenticationRepo;
  var emailData = TextEditingController();
  var passwordData = TextEditingController();

  static SignUpCubit instance(BuildContext context) => BlocProvider.of(context);
  var signUpFormKey = GlobalKey<FormState>();
  bool signUpObscureText = true;
  IconData signUPIcon = Icons.visibility_off;

  void showSignUpPassword() {
    signUpObscureText = !signUpObscureText;
    signUpObscureText
        ? signUPIcon = Icons.visibility_off
        : signUPIcon = Icons.visibility;
    emit(SignUpChangeIconState());
  }

  void checkAndGoLogin() {
    if (signUpFormKey.currentState?.validate() == true) {
      userSignup(email: emailData.text, password: passwordData.text);
    }
  }

  Future<void> userSignup(
      {required String email, required String password}) async {
    emit(SignUpWaitingState());
    var result =
        await authenticationRepo.userSignup(email: email, password: password);
    result.fold((error) => emit(SignUpErrorState(error.errorMessage)),
        (userData)  {
          emit(SignUpSuccessState(userData));

        });
  }

  Future<void> sendEmailVerification() async {
    var result = await authenticationRepo.sendEmailVerification();
    result.fold(
        (error) => emit(SignUpEmailVerificationErrorState(error.errorMessage)),
        (mess) => emit(SignUpEmailVerificationSuccessState()));
  }
}
