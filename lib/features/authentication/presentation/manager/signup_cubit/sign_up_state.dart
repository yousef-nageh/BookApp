
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}
class SignUpChangeIconState extends SignUpStates {}
class SignUpSuccessState extends SignUpStates {
  final UserCredential userData;

  SignUpSuccessState(this.userData);
}
class SignUpErrorState extends SignUpStates {
  final String mess;

  SignUpErrorState(this.mess);
}
class SignUpEmailVerificationSuccessState extends SignUpStates {

}
class SignUpEmailVerificationErrorState extends SignUpStates {
  final String mess;
  SignUpEmailVerificationErrorState(this.mess);
}
class SignUpWaitingState extends SignUpStates {}