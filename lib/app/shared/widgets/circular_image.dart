import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// A widget that displays a circular image.
class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  }) : isHero = false;

  const CircularImage.hero({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  }) : isHero = true;

  final String imageUrl;
  final double height;
  final double width;
  final bool isHero;

  @override
  Widget build(BuildContext context) {
    final child = ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
      ),
    );

    if (isHero) {
      return Hero(tag: imageUrl, child: child);
    }

    return child;
  }
}
