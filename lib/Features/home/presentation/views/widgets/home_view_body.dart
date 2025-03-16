import 'package:booklyapp/Core/utils/theme/cubit/togghe_theme_cubit.dart';
import 'package:booklyapp/Core/utils/widgets/constants.dart';
import 'package:booklyapp/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_books_cubit/newestbooks_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/app_bar_widget.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/newest_list_view_bloc_consumer.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/featured_list_view_bloc_consuer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context
            .read<FeaturedBooksCubit>()
            .fetchFeaturedBooks(isRefresh: true);
        await context
            .read<NewestbooksCubit>()
            .fetchNewestBooks(isRefresh: true);
      },
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: kMainPading.copyWith(
                      right: 0, left: 0, top: 40.h, bottom: 20.h),
                  child: const AppBarWidget(),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured Books',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Transform.scale(
                        scale: .6,
                        child: BlocBuilder<ThemeCubit, ThemeMode>(
                          builder: (context, themeMode) {
                            return Switch(
                              value: themeMode == ThemeMode.dark,
                              onChanged: (value) {
                                context.read<ThemeCubit>().toggleTheme(value);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                const FeaturedListViewBlocConsumer(),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Text(
                    'Newest Books',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
          ),
        ],
        body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child:const NewestListViewBlocBuilder(),
        ),
      ),
    );
  }
}
