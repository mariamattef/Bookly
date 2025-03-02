import 'package:booklyapp/Core/utils/custom_error_widget.dart';
import 'package:booklyapp/Core/utils/widgets/custom_loading_indicator.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_books_cubit/newestbooks_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestNewestListViewBlocBuilder extends StatelessWidget {
  const BestNewestListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestbooksCubit,NewestbooksState>(builder: (context, state) {
      if (state is NewestbooksSuccess) {
        return BestNewestListView(
          books: state.books,
        );
      } else if (state is NewestbooksFailure) {
        return CustomErrorWidget(state.error);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
