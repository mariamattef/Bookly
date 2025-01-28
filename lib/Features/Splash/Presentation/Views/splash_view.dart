import 'package:booklyapp/Features/Splash/Presentation/Views/widgets/splash_view_body.dart';
import 'package:booklyapp/Core/utils/widgets/constants.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SplashViewBody(),
    );
  }
}
