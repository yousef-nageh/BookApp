import 'package:bookly_app_with_mvvm/core/errors/failure.dart';
import 'package:bookly_app_with_mvvm/core/utils/dio_helper.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/repositories/home_repo.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import '../remote/data_sources/home_remote_data_sources.dart';




class HomeRepoImpl implements HomeRepo {
 final HomeRemoteDataSources remoteDataSources;

  HomeRepoImpl(this.remoteDataSources);

  @override
  Future<Either<Failure, List<BookEntity>>> getLowerBooks()async {
   try {
     var books=await remoteDataSources.getLowerBooksData();
     return Right(books);
   } on Exception catch (e) {
     if(e is DioException ){
       return Left(ServerFailure.fromDioError(e));
     }
     return Left(ServerFailure(e.toString()));
   }

  }

  @override
  Future<Either<Failure, List<BookEntity>>> getUpperBooks() async{
    try {
      var books=await remoteDataSources.getUpperBooksData();
      return Right(books);
    } on Exception catch (e) {
      if(e is DioException ){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, List<BookEntity>>> postSearchBooks(String bookName) async{
    try {
      var books= await remoteDataSources.postSearchBooksData(bookName);
      return Right(books);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }

  }






}
