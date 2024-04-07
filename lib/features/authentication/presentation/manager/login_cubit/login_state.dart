
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginStates {}
class LoginInitial extends LoginStates {}
class CheckBoxState extends LoginStates {}
class LongInChangeIconState extends LoginStates {}
class  LongInSuccessState extends LoginStates {
  final UserCredential userData;

  LongInSuccessState(this.userData);
}
class LongInErrorState extends LoginStates {
  final String mess;

  LongInErrorState(this.mess);
}
class LongInWaitingState extends LoginStates {}