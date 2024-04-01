import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSources{
  Future<List<BookEntity>> getUpperBooksData();
  Future<List<BookEntity>> getLowerBooksData();
  Future<List<BookEntity>> postSearchBooksData(String bookName);
}