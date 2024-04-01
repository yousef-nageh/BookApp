import 'package:dio/dio.dart';

class DioHelper{

   final Dio _dio;
//final String _baseUrl="https://www.googleapis.com/books/v1/";
  DioHelper(this._dio){
    _dio.options.baseUrl="https://www.googleapis.com/books/v1/";
  }

  Future<Response> getData({required String endPoint,Map<String,dynamic> ?query,})
  async{
   return await _dio.get(endPoint,queryParameters:query );
  }
}
//volumes?Filtering=free-ebooks&q=subject :programing