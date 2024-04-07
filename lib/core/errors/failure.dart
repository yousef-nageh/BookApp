


import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('connection Time out from ApiSever');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout from ApiSever');
      case DioExceptionType.badCertificate:
        return ServerFailure.fromResponse( dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('cancel  from ApiSever');
      case DioExceptionType.connectionError:
        return ServerFailure(AppString.noInternet);
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout from ApiSever');
      case DioExceptionType.unknown:

        return  ServerFailure("unexpected error please try again later ");


      default:
        return ServerFailure("oops something went wrong. please try again later ");
    }
  }

  factory ServerFailure.fromResponse(int errorNumber, dynamic response) {
    if (errorNumber == 400 || errorNumber == 401 || errorNumber == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (errorNumber == 404) {
      return ServerFailure("method not found");
    } else if (errorNumber == 500) {
      return ServerFailure("internal server error");
    } else {
      return ServerFailure("Oops try again ");
    }
  }
}
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

