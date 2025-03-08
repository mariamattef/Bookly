import 'package:booklyapp/Core/simple_bloc_observer.dart';
import 'package:booklyapp/Core/utils/service_locator.dart';
import 'package:booklyapp/bookly_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'Core/utils/widgets/constants.dart';
import 'Features/home/domain/entities/book_entity.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
   setupServiceLocator();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0xff100B20),
  ));
  runApp(const Boookly());
}
