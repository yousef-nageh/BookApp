
import 'package:bookly_app_with_mvvm/core/errors/failure.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';

import 'package:bookly_app_with_mvvm/features/search/domain/repositories/search_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../app/class/use_case.dart';


class SearchBooksUseCase extends UseCase<List<BookEntity>,String >{
 final SearchRepo searchRepo;

  SearchBooksUseCase(this.searchRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call(String param,{int pageNumber =0}) async{
    return await searchRepo.postSearchBooks(param,pageNumber:pageNumber );

  }
}