import 'package:bookly_app_with_mvvm/app/class/dio_helper.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';

import '../../../../home/data/models/home_model/HomeBookModel.dart';
import 'book_details_remote_data_source.dart';

class BookDetailsRemoteDataSourceImpl extends BookDetailsRemoteDataSource {

  final DioHelper dioHelper;

  BookDetailsRemoteDataSourceImpl(this.dioHelper);
  @override
  Future<List<BookEntity>> relatedBooks(String category)async {
    var response= await dioHelper.getData(endPoint: "volumes",
        query: {
          'Filtering': 'free-ebooks',
          'Sorting': 'relevance ',
          'q': "subject $category",
          'maxResults':"20",

        }
    );
    HomeBookModel homeBookModel=HomeBookModel.fromJson(response.data);
    List<BookEntity> books=[];
    books=homeBookModel.items??[];
    return books;
  }



}