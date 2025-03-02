import 'package:booklyapp/Core/utils/custom_error_widget.dart';
import 'package:booklyapp/Core/utils/widgets/custom_loading_indicator.dart';
import 'package:booklyapp/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/feature_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListViewBlocBuilder extends StatelessWidget {
  const FeaturedListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeatureListView(
            books: state.books,
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
