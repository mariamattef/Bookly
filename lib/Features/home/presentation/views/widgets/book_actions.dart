import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BooksAction extends StatelessWidget {
  final String bookUrl;
  final String tite;
  const BooksAction({super.key, required this.bookUrl, required this.tite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Row(children: [
        Expanded(
            child: CustomButton(
          backgroundColor: Colors.white,
          color: Colors.black,
          text: 'Free \$',
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            bottomLeft: Radius.circular(12.r),
          ),
          onPressed: null,
        )),
        Expanded(
            child: CustomButton(
          backgroundColor: const Color(0xffEF8262),
          color: Colors.white,
          text: 'Free Preview',
          fontSize: 16.sp,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12.r),
            bottomRight: Radius.circular(12.r),
          ),
          onPressed: () {
            if (bookUrl.isNotEmpty) {
              GoRouter.of(context).push(
                AppRouter.kBookView,
                extra: {'webUrl': bookUrl, 'title': tite},
              );
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Invalid URL!")));
            }
          },
        )),
      ]),
    );
  }
}
