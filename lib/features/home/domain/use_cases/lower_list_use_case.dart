import 'package:bookly_app_with_mvvm/app/class/use_case/no_param_use_case.dart';
import 'package:bookly_app_with_mvvm/core/errors/failure.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class LowerListUseCase extends UseCase<List<BookEntity>>{
 final HomeRepo homeRepo;

  LowerListUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call() async{
return  await homeRepo.getLowerBooks();
  }

}