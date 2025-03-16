import 'dart:math' as math;
import 'package:booklyapp/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';


class HomeView extends StatelessWidget {
  final Function(bool) onThemeChanged;
  const HomeView({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  HomeViewBody(),
    );
  }
}









// class HomeView extends StatelessWidget {
//   final Function(bool) onThemeChanged;
//   const HomeView({super.key, required this.onThemeChanged});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomMaterialIndicator(
//         onRefresh: () async {
//           // ToDo : fetchFeaturedBooks Not refresh
//           await context.read<FeaturedBooksCubit>().fetchFeaturedBooks();
//           await context.read<NewestbooksCubit>().fetchNewestBooks();
//         },
//         backgroundColor: Colors.white,
//         indicatorBuilder: (context, controller) {
//           return Padding(
//             padding: const EdgeInsets.all(6.0),
//             child: CircularProgressIndicator(
//               color: Theme.of(context).scaffoldBackgroundColor,
//               value: controller.state.isLoading
//                   ? null
//                   : math.min(controller.value, 2.0),
//             ),
//           );
//         },
//         child:const HomeViewBody(),
//       ),
//     );
//   }
// }


   




// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body:  RefreshIndicator(
//         color: Colors.white,
//       backgroundColor: kPrimaryColor,
//       onRefresh: () async {
//         await context.read<NewestbooksCubit>().fetchNewestBooks();
//         await context.read<FeaturedBooksCubit>().fetchFeaturedBooks();
//       },
//         child: HomeViewBody()),
//     );
//   }
// }



