import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;
  @HiveField(6)
  final String? category;
  @HiveField(7)
  final int? pageCount;
  @HiveField(8)
  final String? pdfUrl;
   @HiveField(9)
  final String? country;
     @HiveField(10)
  final String? description;

  BookEntity({
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
    required this.bookId,
    required this.category,
    required this.pageCount,
    required this.pdfUrl,
    required this.country,
    required this.description,
  });
}
