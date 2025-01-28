import 'package:booklyapp/Core/utils/custom_error_widget.dart';
import 'package:booklyapp/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/utils/widgets/custom_loading_indicator.dart';

class FeatureListView extends StatelessWidget {
  const FeatureListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: const CustomBookImageItem(),
                    );
                  }),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
