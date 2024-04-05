import 'package:bookly_app_with_mvvm/app/class/use_case.dart';
import 'package:bookly_app_with_mvvm/core/errors/failure.dart';
import 'package:bookly_app_with_mvvm/features/details/domain/repositories/book_details_repo.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

class GetRelatedBooksUseCase extends UseCase<List<BookEntity>,String> {

  final BookDetailsRepo bookDetailsRepo;

  GetRelatedBooksUseCase(this.bookDetailsRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call(String param) async {
    return await bookDetailsRepo.getRelatedBooks(param);

  }
}