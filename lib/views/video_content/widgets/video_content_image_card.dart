import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VideoContentImageCard extends StatelessWidget {
  const VideoContentImageCard({Key? key, required this.asset})
      : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(asset),
        Positioned.fill(
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/Play-Fill.svg',
              height: 35,
            ),
          ),
        ),
      ],
    );
  }
}
