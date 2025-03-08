import 'package:booklyapp/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCountPage extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;

  final String countPage;
  const BookCountPage(
      {this.mainAxisAlignment = MainAxisAlignment.start,
      super.key,
      required this.countPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          'Free',
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
