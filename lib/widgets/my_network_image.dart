import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_flix/constants.dart';

class MyNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final bool isLoading, isCircle, useImageBuilder, autoHeight, showDownloadButton;
  final void Function()? onTap, onLongPress;
  final double? height, width;
  final BoxFit fit;
  final Color placeholderColor;
  const MyNetworkImage({
    Key? key,
    this.isLoading = false,
    this.isCircle = false,
    this.autoHeight = false,
    this.useImageBuilder = false,
    this.imageUrl,
    this.height,
    this.onTap,
    this.onLongPress,
    this.fit = BoxFit.cover,
    this.showDownloadButton = true,
    this.width,
    this.placeholderColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Widget widget;
    final cachedNetworkImage = CachedNetworkImage(
      height: height,
      width: width,
      fit: fit,
      placeholder: placeHolder,
      errorWidget: errorWidget,
      imageBuilder: useImageBuilder ? imageBuilder : null,
      imageUrl: imageUrl!,
    );

    if (isCircle) {
      widget = ClipOval(child: cachedNetworkImage);
    } else {
      widget = ClipRRect(
        borderRadius: kBorderRadius,
        child: cachedNetworkImage,
      );
    }

    if (onTap != null || onLongPress != null) {
      return GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: widget,
      );
    }
    return widget;
  }

  Widget imageBuilder(context, imageProvider) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        image: DecorationImage(
          image: imageProvider,
          fit: fit,
        ),
      ),
    );
  }

  Widget placeHolder(BuildContext context, String _) => Container(color: Theme.of(context).colorScheme.secondary);
  Widget errorWidget(BuildContext context, String _, dynamic __) => const Icon(Icons.error_outline_outlined);
}
