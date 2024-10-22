import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_details_appbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: const Column(
        children: [
          CustomBookDetailsAppBar(),
        ],
      ),
    );
  }
}
