import 'package:get/instance_manager.dart';
import 'package:movie_flix/controllers/top_rated_page_controller.dart';

class TopRatedPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopRatedController>(() => TopRatedController());
  }
}
