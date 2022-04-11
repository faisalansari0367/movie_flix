import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_flix/constants.dart';
import 'package:movie_flix/widgets/my_network_image.dart';

import '../models/movie_model.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({Key? key, required this.movie}) : super(key: key);

  final MovieModel movie;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  final controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MyNetworkImage(
              imageUrl: widget.movie.poster,
            ),
            Positioned(
              top: 10,
              left: 10,
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).backgroundColor.withAlpha(50),
                  ),
                  child: const Icon(Icons.arrow_back_ios, size: 20),
                ),
              ),
            ),
            DraggableScrollableSheet(
              builder: builder,
              initialChildSize: 0.3,
              controller: controller,
              maxChildSize: 0.6,
              minChildSize: 0.2,
            ),
          ],
        ),
      ),
    );
  }

  Widget builder(BuildContext context, ScrollController controller) {
    final theme = Theme.of(context);
    return Container(
      // margin: kMargin,
      padding: kMargin,
      margin: EdgeInsets.symmetric(horizontal: kMargin.horizontal),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        boxShadow: [BoxShadow(color: theme.shadowColor.withOpacity(0.1), blurRadius: 10, spreadRadius: 10)],
        borderRadius: const BorderRadius.vertical(top: kRadius),
      ),
      child: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: kBorderRadius,
                  color: theme.iconTheme.color,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.movie.title,
              style: theme.textTheme.subtitle2,
            ),
            const SizedBox(height: 10),
            Text(widget.movie.releaseDate),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.workspace_premium),
                const SizedBox(width: 10),
                Text(widget.movie.popularity.toStringAsFixed(0) + '%'),
              ],
            ),
            const SizedBox(height: 10),
            Text(widget.movie.overview),
          ],
        ),
      ),
    );
  }

  void onClosing() {}
}
