import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestNewestListView extends StatelessWidget {
  final List<BookEntity> books;
  const BestNewestListView({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        separatorBuilder: (conrext, index) => SizedBox(
          height: 15.h,
        ),
        padding: EdgeInsets.only(top: 15.h),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BookListViewItem(
            books: books[index],
          );
        },
      ),
    );
  }
}
