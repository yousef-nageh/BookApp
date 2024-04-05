

import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';

abstract class BookDetailsRemoteDataSource{

 Future <List<BookEntity>> relatedBooks(String category);
}