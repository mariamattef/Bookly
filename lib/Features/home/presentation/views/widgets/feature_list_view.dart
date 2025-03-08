import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../manager/featured_books_cubit/featured_books_cubit.dart';

class FeatureListView extends StatefulWidget {
  final List<BookEntity> books;
  const FeatureListView({super.key, required this.books});

  @override
  State<FeatureListView> createState() => _FeatureListViewState();
}

class _FeatureListViewState extends State<FeatureListView> {
  late final ScrollController _scrollController;
  int nextPage = 1;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    if (_scrollController.hasClients) {
      var maxScrollLength = _scrollController.position.maxScrollExtent;
      var currentPositions = _scrollController.position.pixels;

      if (currentPositions >= 0.7 * maxScrollLength) {
        if (!isLoading) {
          isLoading = true;
          await BlocProvider.of<FeaturedBooksCubit>(context)
              .fetchFeaturedBooks(pageNumber: nextPage++);
          isLoading = false;
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            itemCount: widget.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: CustomBookImageItem(
                    imgUrl: widget.books[index].image.toString()),
              );
            }),
      ),
    );
  }
}
