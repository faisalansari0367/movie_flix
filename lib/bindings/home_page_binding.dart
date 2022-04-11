import 'package:get/instance_manager.dart';
import 'package:movie_flix/controllers/index.dart';
import 'package:movie_flix/controllers/theme_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(() => NavbarController());
    Get.lazyPut<TopRatedController>(() => TopRatedController());
    Get.lazyPut<NowPlayingController>(() => NowPlayingController());
    Get.lazyPut<ThemeController>(() => ThemeController());

  }
}
