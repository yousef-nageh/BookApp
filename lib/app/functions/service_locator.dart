import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/remote/data_sources/home_remote_data_sources_impl.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../class/dio_helper.dart';



final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      HomeRemoteDataSourcesImpl(
        DioHelper(
          Dio(),
        ),
      ),
    ),
  );
}
