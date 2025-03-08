import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CutomLoadingIndicatorFeaturedList extends StatelessWidget {
  const CutomLoadingIndicatorFeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.only(left: 10.w),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: Skeleton.leaf(
                    child: Container(
                      decoration: BoxDecoration(
                        color:  Colors.grey[50],
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      
      ),
    );
  }
}
