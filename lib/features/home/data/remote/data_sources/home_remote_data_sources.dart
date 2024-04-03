import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSources{
  Future<List<BookEntity>> getUpperBooksData({int pageNumber=0});
  Future<List<BookEntity>> getLowerBooksData({int pageNumber=0});
  Future<List<BookEntity>> postSearchBooksData(String bookName);
}