// import 'package:flutter/material.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class CutomLoadingIndicatorNewestList extends StatelessWidget {
//   const CutomLoadingIndicatorNewestList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Skeletonizer(
//       child: ListView(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         children: List.generate(
//           3,
//           (index) => Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 110,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(31, 224, 224, 224),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     height: 110,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: const Color.fromARGB(31, 224, 224, 224),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   const Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('data'),
//                       Text('Programming in Python'),
//                       Text('Author: John Doe'),
//                       Text('Price: 20\$'),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );

//     //  Skeletonizer.sliver(
//     //   child: ListView(
//     //     shrinkWrap: true,
//     //     physics: const NeverScrollableScrollPhysics(),
//     //     children: List.generate(
//     //       5,
//     //       (index) => Padding(
//     //         padding: const EdgeInsets.all(8.0),
//     //         child: Container(
//     //           height: 150,
//     //           width: double.infinity,
//     //           decoration: BoxDecoration(
//     //             color: Colors.grey[200],
//     //             borderRadius: BorderRadius.circular(10),
//     //           ),
//     //           child: Row(children: [
//     //             Container(
//     //               height: 150,
//     //               width: 100,
//     //               decoration: BoxDecoration(
//     //                 color: Colors.grey[300],
//     //                 borderRadius: BorderRadius.circular(10),
//     //               ),
//     //             ),
//     //             const SizedBox(width: 10),
//     //            const Column(children: [
//     //               Text('data'),
//     //               Text('Programming in Python'),
//     //               Text('Author: John Doe'),
//     //               Text('Price: 20\$'),
//     //             ],)
//     //           ],),
//     //         ),
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }
