
import 'package:bookly_app_with_mvvm/core/utils/app_string.dart';
import 'package:dio/dio.dart';

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


