import 'package:booklyapp/Core/utils/assets.dart';
import 'package:booklyapp/Features/Splash/Presentation/Views/widgets/sliding_text.dart';
import 'package:booklyapp/Features/home/presentation/views/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationColnroller;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    _animationColnroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.kLogo),
        const SizedBox(
          height: 5,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(() => const HomeView(),
          transition: Transition.fade, duration: kTabScrollDuration);
    });
  }

  void initSlidingAnimation() {
    _animationColnroller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(_animationColnroller);
    _animationColnroller.forward();
  }
}
