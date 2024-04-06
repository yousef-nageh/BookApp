import '../../../../home/domain/entities/book_entity.dart';

abstract class SearchRemoteDataSource{
  Future<List<BookEntity>> postSearchBooksData(String bookName, {int pageNumber =0});

}
