import 'package:bookly_app_with_mvvm/features/details/data/data_source/remote/book_details_remote_data_source.dart';
import 'package:bookly_app_with_mvvm/features/details/domain/repositories/book_details_repo.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';

class BookDetailsRepoImpl extends BookDetailsRepo {
  final BookDetailsRemoteDataSource remoteDataSource;

  BookDetailsRepoImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<BookEntity>>> getRelatedBooks(String category,) async {
   try {
     var books= await remoteDataSource.relatedBooks(category);
     return Right(books);
   } on Exception catch (e) {
     if(e is DioException ){
       return Left(ServerFailure.fromDioError(e));
     }
     return Left(ServerFailure(e.toString()));
   }
   }

  }
