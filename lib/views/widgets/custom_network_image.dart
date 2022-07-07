import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    required this.link,
    this.width,
    this.height,
    this.color,
    this.iconErrorColor,
  }) : super(key: key);

  final String link;
  final double? width, height;
  final Color? color, iconErrorColor;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: link,
      progressIndicatorBuilder: (ctx, url, progress) => FittedBox(
        fit: BoxFit.scaleDown,
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      fit: BoxFit.cover,
      width: width,
      height: height,
      errorWidget: (ctx, url, error) => Container(
        color: color,
        height: width,
        width: height,
        alignment: Alignment.center,
        child: Icon(
          Icons.error,
          color: iconErrorColor,
        ),
      ),
    );
  }
}
