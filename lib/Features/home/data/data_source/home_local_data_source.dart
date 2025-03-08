import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

import '../../../../Core/utils/widgets/constants.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
  List<BookEntity> searchBooks(String query);
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntity>(kNewestBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> searchBooks(String query) {
    var featuredBooks = Hive.box<BookEntity>(kFeaturedBox).values.toList();
    var newestBooks = Hive.box<BookEntity>(kNewestBox).values.toList();

    List<BookEntity> allBooks = [...featuredBooks, ...newestBooks];

    return allBooks.where((book) {
      return book.title.toLowerCase().contains(query.toLowerCase()) ||
          (book.authorName?.toLowerCase().contains(query.toLowerCase()) ??
              false) ||
          (book.category?.toLowerCase().contains(query.toLowerCase()) ?? false);
    }).toList();
  }
}
