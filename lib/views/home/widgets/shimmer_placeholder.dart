import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/themes/app_theme.dart';

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Shimmer.fromColors(
        baseColor: kSkeletonColor,
        highlightColor: kLightColor,
        child: const SizedBox(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: kBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
