import 'package:flutter/material.dart';
import 'package:movie_flix/widgets/ratings.dart';

import 'my_network_image.dart';

class HorizontalMovieCard extends StatelessWidget {
  final String poster;
  final String name;
  final String backdrop;
  final String date;
  final double rate;
  final String id;
  final Color color;
  final bool isMovie;
  final String? overview;
  final void Function()? onTap;
  const HorizontalMovieCard({
    Key? key,
    required this.poster,
    required this.name,
    required this.backdrop,
    required this.date,
    required this.id,
    required this.color,
    required this.isMovie,
    required this.rate,
    this.onTap,
    this.overview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: MyNetworkImage(
                height: 180,
                width: 140,
                imageUrl: poster,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.subtitle2,
                    ),
                    const SizedBox(height: 25),
                    if (overview != null)
                      Text(
                        overview!,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (overview != null) const SizedBox(height: 10),
                    Row(
                      children: [
                        IconTheme(
                          data: const IconThemeData(
                            // color: Colors.white,
                            size: 20,
                          ),
                          child: Ratings(
                            value: ((rate * 5) / 10).round(),
                          ),
                        ),
                        Text("  " + rate.toString() + "/10")
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
