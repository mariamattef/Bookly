import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Core/utils/service_locator.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklyapp/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_books_cubit/newestbooks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Boookly extends StatelessWidget {
  const Boookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      FeaturedBooksCubit(getIt.get<HomeRepoImpl>())..fetchFeaturedBiooks()),
              BlocProvider(
                  create: (context) =>
                      NewestbooksCubit(getIt.get<HomeRepoImpl>()))
            ],
            child: MaterialApp.router(
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark().copyWith(
                  scaffoldBackgroundColor: const Color(0xff100B20),
                  textTheme: GoogleFonts.montserratTextTheme(
                      ThemeData.dark().textTheme)),
            ),
          );
        });
  }
}
