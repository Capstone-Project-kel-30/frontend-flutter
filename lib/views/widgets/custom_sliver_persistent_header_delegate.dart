import 'package:flutter/material.dart';

import '../../utils/themes/app_theme.dart';

class CustomSPHD extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      color: kBackgroundColor,
      child: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: HSLColor.fromColor(kGreyColor).withLightness(0.8).toColor(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const SizedBox(
            height: 5,
            width: 50,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 20;

  @override
  double get minExtent => 20;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    throw true;
  }
}
