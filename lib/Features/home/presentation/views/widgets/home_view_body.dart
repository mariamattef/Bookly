import 'package:booklyapp/Core/utils/widgets/constants.dart';
import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/app_bar_widget.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/feature_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: kMainPading.copyWith(top: 53, bottom: 20),
                child: const AppBarWidget(),
              ),
              const FeatureListView(),
              SizedBox(height: 40.h),
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
        const SliverFillRemaining(
          child: Padding(
            padding: kMainPading,
            child: BestNewestListView(),
          ),
        )
      ],
    );
  }
}
