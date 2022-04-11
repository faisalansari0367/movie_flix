import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:movie_flix/constants.dart';
import 'package:movie_flix/views/movie_details_view.dart';
import 'package:movie_flix/widgets/movie_card.dart';

import '../models/movie_model.dart';

class MovieListBuilder extends StatelessWidget {
  final List<MovieModel> movies;
  final void Function(String)? itemRemover;
  const MovieListBuilder({
    Key? key,
    required this.movies,
    this.itemRemover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      dragStartBehavior: DragStartBehavior.start,
      itemCount: movies.length,
      itemBuilder: itemBuilder,
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    final item = movies[index];
    return Dismissible(
      key: Key(item.id),
      movementDuration: kDuration,
      onDismissed: (_) => itemRemover != null ? itemRemover!(item.id) : null,
      child: HorizontalMovieCard(
        poster: item.poster,
        name: item.title,
        backdrop: item.backdrop,
        id: item.id,
        color: Colors.transparent,
        date: item.releaseDate,
        rate: item.voteAverage,
        overview: item.overview,
        onTap: () => Get.to(() => MovieDetailsView(movie: item)),
        isMovie: true,
      ),
    );
  }
}
