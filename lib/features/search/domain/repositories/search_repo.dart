import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/domain/entities/book_entity.dart';

abstract class SearchRepo{

  Future<Either<Failure,List<BookEntity>>> postSearchBooks(String bookName,{int pageNumber=0});
}