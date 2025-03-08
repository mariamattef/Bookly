import 'package:booklyapp/Core/errors/failure.dart';
import 'package:booklyapp/Features/home/data/data_source/home_local_data_source.dart';
import 'package:booklyapp/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/repostries/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    List<BookEntity> booksList;
    try {
      booksList =
          homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      booksList =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  // Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber=0}) async {
  //   try {
  //     List<BookEntity> books;
  //     books = homeLocalDataSource.fetchNewestBooks(pageNumber: pageNumber);
  //     if (books.isNotEmpty) {
  //       return right(books);
  //     }
  //     books = await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumber);
  //     return right(books);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioException(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }

  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber=0}) async {
    try {
      List<BookEntity> books;
      books = await homeRemoteDataSource.fetchNewestBooks(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> searchBooks(String query) async {
    try {
      // 🔍 First, check local storage
      List<BookEntity> localBooks = homeLocalDataSource.searchBooks(query);
      if (localBooks.isNotEmpty) {
        return Right(localBooks);
      }

      // 🌐 If no books in local, fetch from remote
      List<BookEntity> remoteBooks =
          await homeRemoteDataSource.searchBooks(query);
      if (remoteBooks.isNotEmpty) {
        return Right(remoteBooks);
      }

      return Left(ServerFailure('No books found'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
