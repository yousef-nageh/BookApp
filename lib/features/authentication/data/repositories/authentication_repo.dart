import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthenticationRepo{
Future<  Either<Failure,UserCredential>> userSignup({required String email,required String password });

}