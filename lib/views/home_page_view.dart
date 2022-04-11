import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movie_flix/controllers/bottom_navbar_controller.dart';
import 'package:movie_flix/views/bottom_navigation.dart';


class HomePageView extends GetView<NavbarController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   leading: const Icon(Icons.arrow_back_ios),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: const Icon(Icons.shopping_cart),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: Obx(
          () {
            return IndexedStack(
              index: controller.tabIndex,
              children: controller.items.map((e) => e.page).toList(),
              // children: [],
            );
            // return Navigator(
            //   key: Get.key,
            //   initialRoute: controller.items.elementAt(controller.tabIndex).route,
            //   // onGenerateRoute: controller.onGenerateRoute,
            // );
          },
        ),
      ),
      bottomNavigationBar: BottomNavbarWidget(controller: controller),
    );
  }
}
