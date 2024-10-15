import 'package:booklyapp/Core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static final textStyle30 = TextStyle(
      fontSize: 30.0.sp,
      fontWeight: FontWeight.normal,
      fontFamily: kGTSectraFine);
  static final textStyle20 = TextStyle(
    fontSize: 20.0.sp,
    fontWeight: FontWeight.normal,
  );
  static final textStyle18 =
      TextStyle(fontSize: 18.0.sp, fontWeight: FontWeight.w600);
  static final textStyle16 =
      TextStyle(fontSize: 16.0.sp, fontWeight: FontWeight.w500);
  static final textStyle14 =
      TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.normal);
}
