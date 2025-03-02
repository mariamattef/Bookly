import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Core/utils/widgets/constants.dart';
import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.books});
  final BookEntity books;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: books);
      },
      child: Container(
        padding: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: const Color.fromARGB(90, 255, 255, 255)),
        ),
        height: MediaQuery.of(context).size.height * .19,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  bottomLeft: Radius.circular(16.r)),
              child: AspectRatio(
                  aspectRatio: 2.5 / 3.75,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: books.image ??
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxiGnEmUfdPwlsecXDA6mZK5tPqgHdJik67A&s',
                    errorWidget: (context, url, error) {
                      return const Icon(Icons.error_outline);
                    },
                  )),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Text(
                      books.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: kGTSectraFine),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    books.authorName ?? '',
                    style: Styles.textStyle14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Free',
                          style: Styles.textStyle18
                              .copyWith(fontWeight: FontWeight.bold)),
                      // Spacer(),
                      BookRating(
                        category: books.rating?.toString() ?? '',
                        countPage: books.pageCount.toString()??'',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
