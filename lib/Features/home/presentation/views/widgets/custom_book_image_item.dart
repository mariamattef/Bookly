import 'package:booklyapp/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImageItem extends StatelessWidget {
  const CustomBookImageItem({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.red,
            image: const DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AssetsData.testImage1))),
      ),
    );
  }
}
