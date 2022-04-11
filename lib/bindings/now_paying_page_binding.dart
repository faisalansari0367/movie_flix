import 'package:get/instance_manager.dart';
import 'package:movie_flix/controllers/now_playing_controller.dart';

class NowPlayingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NowPlayingController>(() => NowPlayingController());
  }
}
