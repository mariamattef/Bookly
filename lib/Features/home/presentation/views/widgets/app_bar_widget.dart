import 'package:booklyapp/Core/utils/app_router.dart';
import 'package:booklyapp/Core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      // Colors.red,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.0.w),
            child: Image.asset(
              AssetsData.kLogo,
              height: 18.h,
              
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
            icon: Padding(
              padding: EdgeInsets.only(right: 20.0.w),
              child: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
