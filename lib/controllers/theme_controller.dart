import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';

class ThemeController extends GetxController {
  final _isDarkMode = Get.isDarkMode.obs;
  bool get isDarkMode => _isDarkMode.value;

  void changeTheme() {
    _isDarkMode.value = !isDarkMode;
    Get.changeThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
    isDarkMode ? Get.changeTheme(themeData()) : Get.changeTheme(darkThemeData());
  }
}
