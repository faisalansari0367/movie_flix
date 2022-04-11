import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_flix/constants.dart';
import 'package:movie_flix/controllers/top_rated_page_controller.dart';
import 'package:movie_flix/widgets/handle_state.dart';
import 'package:movie_flix/widgets/movie_list_builder.dart';

import '../widgets/text_field_with_change_theme.dart';

class TopRatedPageView extends GetView<TopRatedController> {
  const TopRatedPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => TopRatedController());
    return Column(
      children: [
        Padding(
          padding: kMargin,
          child: Obx(() {
            return TextFieldWithChangeTheme(
              clearQuery: controller.clearQuery,
              controller: controller.controller,
              onChanged: controller.onChanged,
              query: controller.query,
            );
          }),
        ),
        Expanded(
          child: Obx(() {
            return HandleState(
              isEmpty: controller.movies.isEmpty,
              isLoading: controller.isLoading,
              child: MovieListBuilder(
                itemRemover: controller.removeItem,
                movies: controller.movies,
              ),
            );
          }),
        )
      ],
    );
  }
}
