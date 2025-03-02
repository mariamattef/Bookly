import 'package:booklyapp/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final int rating;
  final String countPage;
  const BookRating(
      {this.mainAxisAlignment = MainAxisAlignment.start,
      super.key,
      required this.rating,
      required this.countPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
       
        SizedBox(width: 6.3.w),
        Text(
          rating.toString(),
          style: Styles.textStyle16,
        ),
        SizedBox(width: 5.w),
        Opacity(
          opacity: .5,
          child: Text(
            '${(countPage)} pages',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  
  }
}
