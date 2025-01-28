import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImageItem extends StatelessWidget {
  const CustomBookImageItem({super.key,required this.imgUrl});
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            image:  DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(imgUrl))),
      ),
    );
  }
}
