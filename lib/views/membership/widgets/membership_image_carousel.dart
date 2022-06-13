import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../widgets/carousel_indicator.dart';
import '../../widgets/vertical_space.dart';

class MembershipImageCarousel extends StatefulWidget {
  const MembershipImageCarousel({Key? key, required this.imgList})
      : super(key: key);

  final List<String> imgList;

  @override
  State<MembershipImageCarousel> createState() =>
      _MembershipImageCarouselState();
}

class _MembershipImageCarouselState extends State<MembershipImageCarousel> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imgList.length,
          itemBuilder: (_, index, i) {
            return Image.asset(
              widget.imgList[index],
              fit: BoxFit.cover,
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
