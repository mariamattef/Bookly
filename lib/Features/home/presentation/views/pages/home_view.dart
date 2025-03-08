import 'dart:math' as math;
import 'package:booklyapp/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/newest_books_cubit/newestbooks_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomMaterialIndicator(
        onRefresh: () async {
          // ToDo : fetchFeaturedBooks Not refresh
          
          await context.read<FeaturedBooksCubit>().fetchFeaturedBooks();
          await context.read<NewestbooksCubit>().fetchNewestBooks();
        },   
        backgroundColor: Colors.white,
        indicatorBuilder: (context, controller) {
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: CircularProgressIndicator(
              color: Colors.redAccent,
              value: controller.state.isLoading
                  ? null
                  : math.min(controller.value, 1.0),
            ),
          );
        },
        child: const HomeViewBody(),
      ),
    );
  }
}


   




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



