import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class BookDetailsRepo{
Future<Either<Failure,List<BookEntity>>>getRelatedBooks(String category, );

}