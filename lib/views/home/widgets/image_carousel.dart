import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../widgets/vertical_space.dart';
import 'carousel_indicator.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key? key, required this.imgList}) : super(key: key);

  final List<String> imgList;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imgList.length,
          itemBuilder: (_, index, i) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.imgList[index],
                fit: BoxFit.cover,
                height: 166,
                width: 335,
              ),
            );
          },
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (idx, _) {
                setState(() {
                  _current = idx;
                });
              }),
        ),
        const VerticalSpace(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.imgList.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CarouselIndicator(selected: _current == i),
              )
          ],
        ),
      ],
    );
  }
}
