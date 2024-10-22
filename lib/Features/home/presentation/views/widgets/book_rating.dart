import 'package:booklyapp/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  const BookRating(
      {this.mainAxisAlignment = MainAxisAlignment.start, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(FontAwesomeIcons.solidStar,
            size: 16, color: Color(0xffFFDD4F)),
        SizedBox(width: 6.3.w),
        Text(
          '4.8',
          style: Styles.textStyle16,
        ),
        SizedBox(width: 5.w),
        Opacity(
          opacity: .5,
          child: Text(
            '(2390)',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
