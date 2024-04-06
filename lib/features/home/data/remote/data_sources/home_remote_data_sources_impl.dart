

import 'package:bookly_app_with_mvvm/features/home/data/models/home_model/HomeBookModel.dart';
import 'package:bookly_app_with_mvvm/features/home/domain/entities/book_entity.dart';

import '../../../../../app/class/dio_helper.dart';
import 'home_remote_data_sources.dart';

class HomeRemoteDataSourcesImpl extends HomeRemoteDataSources{
  final DioHelper dioHelper;

  HomeRemoteDataSourcesImpl(this.dioHelper);

  @override
  Future<List<BookEntity>> getLowerBooksData({int pageNumber=0}) async{
    var response = await dioHelper.getData(endPoint: "volumes", query: {
      'Filtering':'free-ebooks',
      'Sorting':'newest',
      'q':'subject programing language',
      'startIndex':'${pageNumber*10}',

    });
    HomeBookModel homeBookModel=HomeBookModel.fromJson(response.data);
    List<BookEntity> books=[];
    books=homeBookModel.items??[];
    return books;


  }

  @override
  Future<List<BookEntity>> getUpperBooksData({int pageNumber=0}) async{
    var response = await dioHelper.getData(
        endPoint:
        "volumes",
        query: {
          'Filtering':'free-ebooks',
          'Sorting':'newest',
          'q':'subject  software',
          'startIndex':'${pageNumber*10}',
        },
    );
    HomeBookModel homeBookModel=HomeBookModel.fromJson(response.data);
    List<BookEntity> books=[];
    books=homeBookModel.items??[];
   return books;

  }






}