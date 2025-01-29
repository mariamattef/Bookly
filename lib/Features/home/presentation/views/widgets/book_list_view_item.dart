import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Core/utils/widgets/constants.dart';
import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Features/home/data/models/boook_model/boook.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.books});
  final Boook books;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          height: 130.h,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                    aspectRatio: 2.5 / 4,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: books.volumeInfo?.imageLinks?.thumbnail??'',
                      errorWidget: (context, url, error) {
                        return const Icon(Icons.error_outline);
                      },
                    )),
              ),
              SizedBox(width: 30.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        books.volumeInfo?.title??'',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGTSectraFine),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      books.volumeInfo?.authors?[0]??'',
                      style: Styles.textStyle14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Free',
                            style: Styles.textStyle20
                                .copyWith(fontWeight: FontWeight.bold)),
                        // Spacer(),
                         BookRating(rating: books.volumeInfo?.maturityRating??'', count: books.volumeInfo?.pageCount??0,),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
