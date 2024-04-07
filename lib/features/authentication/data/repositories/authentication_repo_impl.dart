import 'package:bookly_app_with_mvvm/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../app/class/firebase_service.dart';
import 'authentication_repo.dart';

class AuthenticationRepoImpl extends AuthenticationRepo{
  final FireBaseService fireBaseService;

  AuthenticationRepoImpl(this.fireBaseService);

  @override
  Future<Either<Failure, UserCredential>> userSignup({required String email, required String password})  async{
  try {
    var response= await fireBaseService.signInWithEmailPassword(email, password);
    return Right(response);
  } on Exception catch (e) {
    if(e is FirebaseAuthException){
   return left(FirBaseFailure.fromAuth(e));
    }
  return Left(FirBaseFailure(e.toString()));
  }
  }

}