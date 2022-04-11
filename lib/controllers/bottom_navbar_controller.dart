import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:movie_flix/routes/app_route.dart';
import 'package:movie_flix/views/now_playing_page_view.dart';
import 'package:movie_flix/views/top_rated_page.dart';

import '../models/bottom_menu_item.dart';

class NavbarController extends GetxController {
  final _tabIndex = 0.obs;

  int get tabIndex => _tabIndex.value;

  final items = [
    const BottomMenuItem(
      iconData: Icons.movie_creation_outlined,
      label: 'Top Rated',
      page: TopRatedPageView(),
      route: AppRoute.home,
      // key: ValueKey(AppRoute.topRated),
    ),
    const BottomMenuItem(
      iconData: Icons.stars_outlined,
      label: 'Now Playing',
      page: SearchPageView(),
      route: AppRoute.search,
    ),
  ];

  void updateTab(int index) {
    // Get.toNamed(items.elementAt(index).route);
    _tabIndex.value = index;
  }

  // Route onGenerateRoute(RouteSettings settings) {
  //   final page = items.firstWhere((element) => element.page == settings.name);

  // }
}
