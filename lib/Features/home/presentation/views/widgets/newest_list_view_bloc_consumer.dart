import 'package:booklyapp/Core/utils/custom_error_widget.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_books_cubit/newestbooks_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_loading_indicator_newest_list.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListViewBlocBuilder extends StatelessWidget {
  const NewestListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestbooksCubit, NewestbooksState>(
        listener: (context, state) {
      if (state is NewestbooksFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.error)),
        );
      }
    }, builder: (context, state) {
      if (state is NewestbooksSuccess) {
        return NewestListView(
          books: state.books,
        );
      } else if (state is NewestbooksFailure) {
        return CustomErrorWidget(state.error);
      } else {
        return const CutomLoadingIndicatorNewestList();
      }
    });
  }
}



