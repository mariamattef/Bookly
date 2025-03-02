import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class BooksAction extends StatelessWidget {
  final String pdfUrl;
  const BooksAction({super.key, required this.pdfUrl});




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Row(children: [
         Expanded(
            child: CustomButton(
          backgroundColor: Colors.white,
          color: Colors.black,
          text: 'Free \$',
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            bottomLeft: Radius.circular(12.r),
          ), onPressed: null,
        )),
        Expanded(
            child: CustomButton(
          backgroundColor: const Color(0xffEF8262),
          color: Colors.white,
          text: 'Free Preview',
          fontSize: 16.sp,
          borderRadius:  BorderRadius.only(
            topRight: Radius.circular(12.r),
            bottomRight: Radius.circular(12.r),
          ),
          onPressed: 
          () {
                print("Button tapped! URL: $pdfUrl"); // Debugging

              if (pdfUrl.isNotEmpty && Uri.tryParse(pdfUrl)?.isAbsolute == true) {
                GoRouter.of(context).push(AppRouter.kBookView, extra: pdfUrl);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text("There is no preview available for this book"),
                  ),
                );
              }
          },
        )),
      ]),
    );
  }
}
