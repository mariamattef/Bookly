import 'package:booklyapp/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class Boookly extends StatelessWidget {
  const Boookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: const Color(0xff100B20)),
      home: const SplashView(),
    );
  }
}
