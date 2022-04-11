import 'package:get/instance_manager.dart';
import 'package:movie_flix/controllers/theme_controller.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
  }
}
