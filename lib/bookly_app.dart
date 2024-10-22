import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: const Color(0xff100B20),
                textTheme: GoogleFonts.montserratTextTheme(
                    ThemeData.dark().textTheme)),
          );
        });
  }
}
