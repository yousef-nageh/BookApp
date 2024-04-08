import 'package:bookly_app_with_mvvm/app/class/dio_helper.dart';

import '../../../../../app/class/app_endpoint.dart';
import '../../../../home/data/models/home_model/home_book_model.dart';
import '../../../../home/domain/entities/book_entity.dart';
import 'search_remote_data_source.dart';

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource{
  final DioHelper dioHelper;

  SearchRemoteDataSourceImpl(this.dioHelper);
  @override
  Future<List<BookEntity>> postSearchBooksData(String bookName,
      {int pageNumber = 0})async {
    var response = await dioHelper.getData(endPoint: AppEndpoint.volumes,
        query: {
          'Filtering':'free-ebooks',
          'Sorting':'newest',
          'q':'subject $bookName',
          'startIndex':'${pageNumber*10}',
        }
    );
    HomeBookModel homeBookModel =HomeBookModel.fromJson(response.data);
    List<BookEntity> books=[];
    books=homeBookModel.items??[];
    return books;
  }
}