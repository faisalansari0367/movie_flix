import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix/controllers/theme_controller.dart';

class ChangeThemeIcon extends GetView<ThemeController> {
  const ChangeThemeIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Obx(
        () => Icon(
          controller.isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      onPressed: controller.changeTheme,
    );
  }
}
