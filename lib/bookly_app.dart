import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Core/utils/service_locator.dart';
import 'package:booklyapp/Core/utils/theme/cubit/togghe_theme_cubit.dart';
import 'package:booklyapp/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:booklyapp/Features/home/domain/use_cases/newest_books_use_case.dart';
import 'package:booklyapp/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/manager/newest_books_cubit/newestbooks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:go_router/go_router.dart';
class Boookly extends StatelessWidget {
  const Boookly({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = AppRouter.createRouter(
      (isDark) => context.read<ThemeCubit>().toggleTheme(isDark),
    );

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  FeaturedBooksCubit(getIt<FetchFeaturedBooksUseCase>())
                    ..fetchFeaturedBooks(),
            ),
            BlocProvider(
              create: (context) =>
                  NewestbooksCubit(getIt<NewestBooksUseCase>())
                    ..fetchNewestBooks(),
            ),
            BlocProvider(
              create: (context) => ThemeCubit(), // Provide ThemeCubit
            ),
          ],
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp.router(
                title: 'BooklyApp',
                theme: FlexThemeData.light(),
                darkTheme: FlexThemeData.dark(),
                themeMode: themeMode,
                routerConfig: router, // Router is created ONCE
                debugShowCheckedModeBanner: false,
              );
            },
          ),
        );
      },
    );
  }
}
