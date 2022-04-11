import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix/controllers/index.dart';
import 'package:movie_flix/widgets/text_field_with_change_theme.dart';

import '../constants.dart';
import '../widgets/handle_state.dart';
import '../widgets/movie_list_builder.dart';

class SearchPageView extends GetView<NowPlayingController> {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: kMargin,
          child: Obx(() {
            return TextFieldWithChangeTheme(
              controller: controller.controller,
              onChanged: controller.onChanged,
              clearQuery: controller.clearQuery,
              query: controller.query,
            );
          }),
        ),
        Expanded(
          child: Obx(() {
            return HandleState(
              isLoading: controller.isLoading,
              isEmpty: controller.movies.isEmpty && !controller.isLoading,
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
