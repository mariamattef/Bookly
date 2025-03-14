import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({required this.slidingAnimation, super.key});
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, _) {
        return SlideTransition(
            position: slidingAnimation,
            child: const Text('Read Free Books', textAlign: TextAlign.center));
      },
      animation: slidingAnimation,
    );
  }
}
