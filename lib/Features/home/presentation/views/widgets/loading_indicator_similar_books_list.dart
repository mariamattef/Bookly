import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';


class LoadingIndicatorSimilarBooksList extends StatelessWidget {
  const LoadingIndicatorSimilarBooksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: AspectRatio(
                aspectRatio: 2.7 / 4,
                child: SizedBox(
                  width: 120.w,
                  child: Skeleton.leaf(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(31, 224, 224, 224),
                        borderRadius: BorderRadius.circular(10), // Match the radius
                      ),
                      child: Container(),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}





// class LoadingIndicatorSimilarBooksList extends StatelessWidget {
//   const LoadingIndicatorSimilarBooksList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
     
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height * .15,
//         child: ListView.builder(
//             itemCount: 10,
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               return Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 5.0.w),
//                   child: AspectRatio(
//                     aspectRatio: 2.7 / 4,
//                     child: SizedBox(
//                       width: 120.w,
//                       child: Skeleton.leaf(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(31, 224, 224, 224),
//                             borderRadius:
//                                 BorderRadius.circular(16), // Skeleton color
//                           ),
//                         ),
//                       ),
//                     ),
//                   ));
//             }),
//       ),
//     );
//   }
// }
