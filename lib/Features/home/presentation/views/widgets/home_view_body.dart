import 'package:booklyapp/Core/utils/assets.dart';
import 'package:booklyapp/Core/utils/constants.dart';
import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/app_bar_widget.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/feature_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBarWidget(),
        const FeatureListView(),
        SizedBox(height: 50.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            'Best Seller',
            style: Styles.textStyle18,
          ),
        ),
        const BestSellerListView(),
      ],
    );
  }
}

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.red,
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(AssetsData.testImage1))),
              ),
            ),
            const SizedBox(width: 30),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    'Herry Potter and the Goblet of Fire',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
