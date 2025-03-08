import 'package:booklyapp/Features/home/data/data_source/home_local_data_source.dart';
import 'package:booklyapp/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklyapp/Features/home/domain/repostries/home_repo.dart';
import 'package:booklyapp/Features/home/domain/use_cases/newest_books_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:booklyapp/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:booklyapp/Core/utils/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Register ApiService
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // Register Data Sources
  getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(getIt<ApiService>()));

  getIt.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl());

  // Register Repository
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(
        homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
        homeLocalDataSource: getIt<HomeLocalDataSource>(),
      ));

  // Register FetchFeaturedBooksUseCase
  getIt.registerLazySingleton<FetchFeaturedBooksUseCase>(
      () => FetchFeaturedBooksUseCase(homeRepo: getIt<HomeRepo>()));
// Register NewestBooksUseCase
  getIt.registerLazySingleton<NewestBooksUseCase>(
      () => NewestBooksUseCase(homeRepo: getIt<HomeRepo>()));
}
