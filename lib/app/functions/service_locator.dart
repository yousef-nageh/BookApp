import 'package:bookly_app_with_mvvm/app/class/firebase_service.dart';
import 'package:bookly_app_with_mvvm/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:bookly_app_with_mvvm/features/details/data/data_source/remote/book_details_remote_data_source_impl.dart';
import 'package:bookly_app_with_mvvm/features/details/data/repositories/book_details_repo_impl.dart';
import 'package:bookly_app_with_mvvm/features/search/data/data_source/remote/search_remote_data_source_impl.dart';
import 'package:bookly_app_with_mvvm/features/search/data/repo/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/remote/data_sources/home_remote_data_sources_impl.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../class/dio_helper.dart';



final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<DioHelper>(DioHelper(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      HomeRemoteDataSourcesImpl(
       getIt.get<DioHelper>()
      ),
    ),
  );
  getIt.registerSingleton<BookDetailsRepoImpl>(BookDetailsRepoImpl(BookDetailsRemoteDataSourceImpl( getIt.get<DioHelper>())));
getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(SearchRemoteDataSourceImpl(getIt.get<DioHelper>())));
getIt.registerSingleton<FireBaseService>(FireBaseService());
getIt.registerSingleton<AuthenticationRepoImpl>(AuthenticationRepoImpl(getIt.get<FireBaseService>()));
}
