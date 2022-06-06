import 'package:flutter/material.dart';

import 'image_card.dart';
import 'video_image_card.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    required this.imgList,
    required this.title,
    required this.onTap,
    required this.video,
  }) : super(key: key);

  final List<String> imgList;
  final String title;
  final Function() onTap;
  final bool video;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width - 2 * 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: onTap,
            child: video
                ? VideoImageCard(asset: imgList[0], title: title)
                : ImageCard(asset: imgList[0], title: title),
          );
        }),
      ),
    );
  }
}
