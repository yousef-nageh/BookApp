
abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}
class SignUpChangeIconState extends SignUpStates {}
class SignUpSuccessState extends SignUpStates {}
class SignUpErrorState extends SignUpStates {
  final String mess;

  SignUpErrorState(this.mess);
}
class SignUpWaitingState extends SignUpStates {}