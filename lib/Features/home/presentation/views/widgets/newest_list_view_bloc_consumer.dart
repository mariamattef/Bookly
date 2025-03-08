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



// class NewestListViewBlocBuilder extends StatelessWidget {
//   const NewestListViewBlocBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: () async {
//         context.read<NewestbooksCubit>().refreshBooks(); // Refresh books
//       },
//       child: BlocConsumer<NewestbooksCubit, NewestbooksState>(
//         listener: (context, state) {
//           if (state is NewestbooksFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.error)),
//             );
//           }
//         },
        // builder: (context, state) {
        //   if (state is NewestbooksSuccess) {
        //     return ListView.builder(
        //       physics: const AlwaysScrollableScrollPhysics(),
        //       itemCount: state.books.length + 1, // Add space for pagination loader
        //       itemBuilder: (context, index) {
        //         if (index < state.books.length) {
        //           return BookListViewItem(books: state.books[index],);
        //         } else {
        //           return _buildPaginationIndicator(context);
        //         }
        //       },
        //     );
        //   } else if (state is NewestbooksFailure) {
        //     return CustomErrorWidget(state.error);
        //   } else {
        //     return const CutomLoadingIndicatorNewestList();
        //   }
        // },
//       ),
//     );
//   }

  // Widget _buildPaginationIndicator(BuildContext context) {
  //   final cubit = context.watch<NewestbooksCubit>();
  //   return cubit.isFetching
  //       ? const Center(child: CircularProgressIndicator())
  //       : const SizedBox(); // Hide if no more data
  // }
// }