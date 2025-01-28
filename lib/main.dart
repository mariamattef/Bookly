import 'package:booklyapp/Core/utils/service_locator.dart';
import 'package:booklyapp/bookly_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  setUpServiceLocator();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xff100B20),
  ));
  runApp(const Boookly());
}
