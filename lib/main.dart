import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix/bindings/home_page_binding.dart';
import 'package:movie_flix/routes/app_page.dart';
import 'package:movie_flix/routes/app_route.dart';
import 'package:movie_flix/theme/theme.dart';
import 'package:movie_flix/views/home_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie flix',
      theme: Get.isDarkMode ? themeData() : darkThemeData(),
      debugShowCheckedModeBanner: false,
      getPages: AppPage.routes,
      initialRoute: AppRoute.home,
    );
  }
}
