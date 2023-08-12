import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/search/data/data_Sources/search_local_data_source.dart';
import 'package:bookly_app/features/search/data/data_Sources/search_remote_data_source.dart';
import 'package:bookly_app/features/search/data/repository/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>()),
    homeLocalDataSource: HomeLocalDataSourceImpl(),
  ));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(searchLocalDataSource: SearchLocalDataSourceImpl(),
  searchRemoteDataSource: SearchRemoteDataSourceImpl(getIt.get<ApiService>())));
}
