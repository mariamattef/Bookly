import 'package:booklyapp/Core/utils/widgets/constants.dart';
import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/app_bar_widget.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/best_newest_list_view_bloc_builder.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/featured_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: kMainPading.copyWith(top: 40.h, bottom: 20.h),
                child: const AppBarWidget(),
              ),
              SizedBox(height: 10.h),
              const FeaturedListViewBlocBuilder(),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: kMainPading,
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: kMainPading,
            child: const BestNewestListViewBlocBuilder(),
          ),
        )
      ],
    );
  }
}
