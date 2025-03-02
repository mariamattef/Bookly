import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureListView extends StatefulWidget {
  final List<BookEntity> books;
  const FeatureListView({super.key, required this.books});

  @override
  State<FeatureListView> createState() => _FeatureListViewState();
}

class _FeatureListViewState extends State<FeatureListView> {
  // late final ScrollController _scrollController;
//   bool hasReached70Percent = false;
// int nexrPage=1;
//   @override
//   void initState() {
//     super.initState();
//     _scrollController == ScrollController();
//     _scrollController.addListener(_onScroll);
//   }

//   void _onScroll() {
//     if (_scrollController.hasClients) {
//       double maxScroll = _scrollController.position.maxScrollExtent;
//       double currentScroll = _scrollController.position.pixels;

//       double percentage = (currentScroll / maxScroll) * 100;

//       if (percentage >= 70 && !hasReached70Percent) {
//         setState(() {
//           hasReached70Percent = true;
//         });
//         print("FeatureListView reached 70%!");
//         BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks( pageNumber:nexrPage++   );
//       }
//     }
//   }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            // controller: _scrollController,
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
