import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_books_cubit/newestbooks_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewestListView extends StatefulWidget {
  final List<BookEntity> books;
  const NewestListView({super.key, required this.books});

  @override
  State<NewestListView> createState() => _NewestListViewState();
}

class _NewestListViewState extends State<NewestListView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<NewestbooksCubit>().fetchNewestBooks();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.only(top: 15.h),
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.books.length + 1,
        itemBuilder: (context, index) {
          if (index < widget.books.length) {
            return BookListViewItem(
              books: widget.books[index],
            );
          } else {
            return _buildPaginationIndicator(context);
          }
        },
      ),
    );
  }

  Widget _buildPaginationIndicator(BuildContext context) {
    final cubit = context.watch<NewestbooksCubit>();
    return cubit.isFetching
        ? const Center(child: CircularProgressIndicator())
        : const SizedBox();
  }
}
