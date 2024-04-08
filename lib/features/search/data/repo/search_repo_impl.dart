import 'package:bookly_app_with_mvvm/features/search/data/data_source/remote/search_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../../domain/repositories/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<BookEntity>>> postSearchBooks(String bookName,{int pageNumber=0}) async{
    try {
      var books= await remoteDataSource.postSearchBooksData(bookName,pageNumber:pageNumber );
      return Right(books);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));

    }

  }
}