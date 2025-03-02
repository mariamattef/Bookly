import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_actions.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_details_appbar_view.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/similar_books_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../manager/newest_books_cubit/newestbooks_cubit.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookEntity book;
  final List<BookEntity>? books;
  const BookDetailsViewBody({super.key, required this.book, this.books});

  @override
  Widget build(BuildContext context) {
    context.read<NewestbooksCubit>().fetchNewestBooks();
    print('pageCount ${book.pageCount}');
    print('category ${book.category}');
    print('pdfUrl ${book.pdfUrl}');
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0.w),
        child: Column(
          children: [
            const CustomBookDetailsAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.16),
              child: CustomBookImageItem(
                  imgUrl: book.image ??
                      'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg'),
            ),
            SizedBox(
              height: 43.h,
            ),
            Text(
              textAlign: TextAlign.center,
              book.title,
              style: Styles.textStyle30.copyWith(),
            ),
            SizedBox(height: 6.h),
            Text(
              textAlign: TextAlign.center,
              book.authorName ?? 'Unknown Author',
              style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16.h),
            BookRating(
              // ToDo: Category and pageCount are not coming from the API ,coming Null
              mainAxisAlignment: MainAxisAlignment.center,
              rating: book.rating?.toInt() ?? 0,
              countPage: book.pageCount?.toString() ?? 'No',
            ),
            SizedBox(height: 37.h),
            BooksAction(
              // ToDo: pdfUrl is not coming from the API ,coming Null
              pdfUrl: book.pdfUrl ?? '',
            ),
            SizedBox(height: 40.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You can also like this',
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 16.h),
            SimilarBookListView(book: books ?? []),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
