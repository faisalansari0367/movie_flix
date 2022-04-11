import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottom_navbar_controller.dart';
import '../models/bottom_menu_item.dart';

class BottomNavbarWidget extends StatelessWidget {
  final NavbarController controller;
  const BottomNavbarWidget({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Obx(() {
      return BottomNavigationBar(
        elevation: 1.0,
        type: BottomNavigationBarType.fixed,
        onTap: controller.updateTab,
        unselectedIconTheme: theme.iconTheme,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: theme.iconTheme,
        currentIndex: controller.tabIndex,
        items: controller.items
            .map(
              (BottomMenuItem item) => BottomNavigationBarItem(
                icon: Icon(
                  item.iconData,
                  color: controller.tabIndex == controller.items.indexOf(item)
                      ? theme.primaryColor
                      : theme.iconTheme.color,
                ),
                label: item.label,
              ),
            )
            .toList(),
      );
    });
  }
}
