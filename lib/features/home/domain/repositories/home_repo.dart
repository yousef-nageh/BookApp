import 'package:bookly_app_with_mvvm/core/errors/failure.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookEntity>>> getUpperBooks({int pageNumber=0});
  Future<Either<Failure,List<BookEntity>>> getLowerBooks();
  Future<Either<Failure,List<BookEntity>>> postSearchBooks(String bookName);
}