import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_books_cubit/newestbooks_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/loading_indicator_similar_books_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBookListView extends StatefulWidget {
  final List<BookEntity> book;
  const SimilarBookListView({super.key, required this.book});

  @override
  State<SimilarBookListView> createState() => _SimilarBookListViewState();
}

class _SimilarBookListViewState extends State<SimilarBookListView> {
  @override
  void initState() {
    super.initState();
    context.read<NewestbooksCubit>().fetchNewestBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestbooksCubit, NewestbooksState>(
      builder: (context, state) {
        if (state is NewestbooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              padding: EdgeInsets.zero,
                itemCount: state.books.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                    child: CustomBookImageItem(
                      imgUrl: state
                              .books[index].image??
                          '://lhttpsetsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg',
                    ),
                  );
                }),
          );      
        } else if (state is NewestbooksFailure) {
          return Center(
            child: Text(state.error),
          );
        }
        return const LoadingIndicatorSimilarBooksList();
      },
    );
  }
}
