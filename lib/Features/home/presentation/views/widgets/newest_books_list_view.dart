import 'package:booklyapp/Core/utils/custom_error_widget.dart';
import 'package:booklyapp/Core/utils/widgets/custom_loading_indicator.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_books_cubit/newestbooks_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestNewestListView extends StatelessWidget {
  const BestNewestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestbooksCubit, NewestbooksState>(
      builder: (context, state) {
        if (state is NewestbooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return  BookListViewItem(books: state.books[index],);
            },
          );
        } else if (state is NewestbooksFailure) {
          return CustomErrorWidget(state.error);
        }
        return const CustomLoadingIndicator();
      },
    );
  }
}
