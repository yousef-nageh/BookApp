import 'package:bookly_app_with_mvvm/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../app/class/firebase_service.dart';
import '../../../../core/errors/firebase_failure.dart';
import 'authentication_repo.dart';

class AuthenticationRepoImpl extends AuthenticationRepo{
  final FireBaseService fireBaseService;

  AuthenticationRepoImpl(this.fireBaseService);

  @override
  Future<Either<Failure, UserCredential>> userSignup({required String email, required String password})  async{
  try {
    var response= await fireBaseService.signUpWithEmailPassword(email, password);
    return Right(response);
  } on Exception catch (e) {
    if(e is FirebaseAuthException){
   return left(FirBaseFailure.fromAuth(e));
    }
  return Left(FirBaseFailure(e.toString()));
  }
  }

  @override
  Future<Either<Failure, Unit>> sendEmailVerification() async {
    try {
      await fireBaseService.sendEmailVerification();
      return const Right(unit);
    } on Exception catch (e) {
      if(e is FirebaseAuthException){
        return left(FirBaseFailure.fromAuth(e));
      }
      return Left(FirBaseFailure(e.toString()));
    }


  }

  @override
  Future<Either<Failure, UserCredential>> userLogin({required String email, required String password}) async {
    try {
      var response= await fireBaseService.signInWithEmailAndPassword(email, password);
      return Right(response);
    } on Exception catch (e) {
      if(e is FirebaseAuthException){
        return left(FirBaseFailure.fromAuth(e));
      }
      return Left(FirBaseFailure(e.toString()));
    }

  }


}