import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movie_flix/controllers/bottom_navbar_controller.dart';
import 'package:movie_flix/views/bottom_navigation.dart';

class HomePageView extends GetView<NavbarController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            return IndexedStack(
              index: controller.tabIndex,
              children: controller.items.map((e) => e.page).toList(),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavbarWidget(controller: controller),
    );
  }
}
