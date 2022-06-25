import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'carousel_indicator.dart';
import 'vertical_space.dart';

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
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imgList.length,
          itemBuilder: (_, index, i) {
            return ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                ).createShader(bounds);
              },
              child: Image.asset(
                widget.imgList[index],
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              height: 280,
              onPageChanged: (idx, _) {
                setState(() {
                  _current = idx;
                });
              }),
        ),
        const VerticalSpace(height: 10),
        Positioned.fill(
          bottom: 20,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.imgList.length; i++)
                  CarouselIndicator(selected: _current == i)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
