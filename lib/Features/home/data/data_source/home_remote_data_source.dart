import 'package:booklyapp/Core/utils/api_service.dart';
import 'package:booklyapp/Core/utils/functions/save_books.dart';
import '../../../../Core/utils/widgets/constants.dart';
import '../../domain/entities/book_entity.dart';
import '../models/boook_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0});
  Future<List<BookEntity>> searchBooks(String query);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=sports&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, kNewestBox);
    return books;
  }

  @override
  Future<List<BookEntity>> searchBooks(String query) async {
    var data = await apiService.get(
        endpoint: 'volumes?Filtering=free-ebooks&q=$query');

    List<BookEntity> booksSearchList = getBooksList(data);
    return booksSearchList;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      try {
        books.add(BookModel.fromJson(bookMap));
      } catch (e) {
        print("❌ Error Parsing Book: $e");
      }
    }
    return books;
  }
}
