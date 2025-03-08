import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImageItem extends StatelessWidget {
  final String imgUrl;
  const CustomBookImageItem({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: SizedBox(
        width: 120.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: imgUrl, 
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
