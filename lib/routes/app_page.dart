import 'package:get/route_manager.dart';
import 'package:movie_flix/routes/app_route.dart';
import 'package:movie_flix/views/home_page_view.dart';
import 'package:movie_flix/views/now_playing_page_view.dart';
import 'package:movie_flix/views/top_rated_page.dart';

import '../bindings/index.dart';

class AppPage {
  static final topRatedPage =  GetPage(name: AppRoute.topRated, page: () => const TopRatedPageView(), binding: TopRatedPageBinding());
  static final routes = [
    GetPage(name: AppRoute.home, page: () => const HomePageView(), binding: HomePageBinding()),
    GetPage(name: AppRoute.search, page: () => const SearchPageView(), binding: NowPlayingPageBinding()),
    GetPage(name: AppRoute.topRated, page: () => const TopRatedPageView(), binding: TopRatedPageBinding()),
  ];
}
