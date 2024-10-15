import 'package:booklyapp/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // left: 24.w, right: 24.h, top: 40.h, bottom: 20.
      children: [
        Image.asset(
          AssetsData.kLogo,
          height: 18.h,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 24,
          ),
        ),
      ],
    );
  }
}
