import 'package:booklyapp/Core/utils/custom_error_widget.dart';
import 'package:booklyapp/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_loading_list_view_featured_books.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/feature_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Core/utils/functions/error_snack_bar.dart';

class FeaturedListViewBlocConsumer extends StatelessWidget {
  const FeaturedListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksPaginationFailure) {
          showErrorSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeatureListView(books: state.books);
        } else if (state is FeaturedBooksPaginationLoading) {
          return FeatureListView(books: state.books); 
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(state.errorMessage);
        } else {
          return const CutomLoadingIndicatorFeaturedList();
        }
      },
    );
  }
}

// class FeaturedListViewBlocConsumer extends StatefulWidget {
//   const FeaturedListViewBlocConsumer({
//     super.key,
//   });

//   @override
//   State<FeaturedListViewBlocConsumer> createState() =>
//       _FeaturedListViewBlocConsumerState();
// }

// class _FeaturedListViewBlocConsumerState
//     extends State<FeaturedListViewBlocConsumer> {
//   List<BookEntity> books = [];
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
//       listener: (context, state) {
//         if (state is FeaturedBooksLoading) {
//           books.clear();
//         }
//         if (state is FeaturedBooksSuccess) {
//           books.addAll(state.books);
//         }
//         if (state is FeaturedBooksPaginationFailure) {
//           showErrorSnackBar(context, state.errorMessage);
//         }
//       },
//       builder: (context, state) {
//         if (state is FeaturedBooksSuccess ||
//             state is FeaturedBooksPaginationLoading ||
//             state is FeaturedBooksPaginationFailure) {
//           return FeatureListView(
//             books: books,
//           );
//         } else if (state is FeaturedBooksFailure) {
//           return CustomErrorWidget(state.errorMessage);
//         } else {
//           return const CutomLoadingIndicatorFeaturedList();
//         }
//       },
//     );
//   }
// }
