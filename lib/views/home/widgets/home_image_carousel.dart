import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../widgets/carousel_indicator.dart';
import '../../widgets/vertical_space.dart';
import 'carousel_image_card.dart';

class HomeImageCarousel extends StatefulWidget {
  const HomeImageCarousel({
    Key? key,
    required this.imgList,
    required this.textList,
  }) : super(key: key);

  final List<String> imgList;
  final List<List<String>> textList;

  @override
  State<HomeImageCarousel> createState() => _HomeImageCarouselState();
}

class _HomeImageCarouselState extends State<HomeImageCarousel> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imgList.length,
          itemBuilder: (_, index, i) {
            return CarouselImageCard(
              img: widget.imgList[index],
              textList: widget.textList[index],
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
              CarouselIndicator(selected: _current == i)
          ],
        ),
      ],
    );
  }
}
