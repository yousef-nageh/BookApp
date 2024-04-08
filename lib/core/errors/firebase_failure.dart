import 'package:firebase_auth/firebase_auth.dart';

import '../utils/app_string.dart';
import 'failure.dart';

class FirBaseFailure extends Failure {
  FirBaseFailure(super.errorMessage);

  factory FirBaseFailure.fromAuth(FirebaseAuthException exception){
    if (exception.code == 'weak-password') {
      return FirBaseFailure("The password provided is too weak.") ;
    } else if (exception.code == 'email-already-in-use') {
      return FirBaseFailure("The account already exists for that email.") ;
    }else if(exception.code =="network-request-failed"){
      return  FirBaseFailure(AppString.noInternet);
    }else if(exception.code == 'user-not-found'){
      return  FirBaseFailure("User not found. Please sign up.");
    }else if(exception.code == 'invalid-credential'){
      return  FirBaseFailure("Wrong password provided for that user.");
    } else{

      return FirBaseFailure(exception.message??"" );
    }

  }
}