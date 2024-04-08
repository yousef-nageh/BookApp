
import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';
import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}




