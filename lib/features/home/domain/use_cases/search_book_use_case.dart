
import 'package:bookly_app_with_mvvm/core/errors/failure.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../app/class/use_case.dart';


class SearchBooksUseCase extends UseCase<List<BookEntity>,String >{
 final HomeRepo homeRepo;

  SearchBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call(String param) async{
    return await homeRepo.postSearchBooks(param);

  }
}