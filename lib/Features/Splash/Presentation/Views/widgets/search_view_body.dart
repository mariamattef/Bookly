import 'package:booklyapp/Core/utils/styles.dart';
import 'package:booklyapp/Features/Search/presentation/widgets/custom_search_text_field.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchTextField(),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          const Expanded(child: SearchResultListView())
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 35.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        // return const BookListViewItem(books: '://lhttpsetsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg',);
        return const Text('data');
      },
    );
  }
}
