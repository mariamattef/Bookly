import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_actions.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_details_appbar_view.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/similar_books_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomBookDetailsAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.16),
              child: const CustomBookImageItem(),
            ),
            SizedBox(
              height: 43.h,
            ),
            Text(
              'The Jungle Book',
              style: Styles.textStyle30.copyWith(),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(
              'Rudyard Kipling',
              style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 16.h,
            ),
            const BookRating(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            SizedBox(
              height: 37.h,
            ),
            const BooksAction(),
            SizedBox(
              height: 40.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You can also like this',
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const SimilarBookListView(),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
