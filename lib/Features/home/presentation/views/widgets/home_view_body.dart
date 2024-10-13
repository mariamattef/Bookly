import 'package:booklyapp/Features/home/presentation/views/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarWidget(),
      ],
    );
  }
}
