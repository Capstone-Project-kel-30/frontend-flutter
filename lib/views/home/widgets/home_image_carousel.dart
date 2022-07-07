import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../models/user_model.dart';
import '../../../utils/common/constant.dart';
import '../../../utils/routes/routes.gr.dart';
import '../../widgets/carousel_indicator.dart';
import '../../widgets/vertical_space.dart';
import 'carousel_image_card.dart';

class HomeImageCarousel extends StatefulWidget {
  const HomeImageCarousel({
    Key? key,
    required this.imgList,
    required this.isMembership,
    required this.user,
  }) : super(key: key);

  final List<String> imgList;
  final bool isMembership;
  final UserModel user;

  @override
  State<HomeImageCarousel> createState() => _HomeImageCarouselState();
}

class _HomeImageCarouselState extends State<HomeImageCarousel> {
  int _current = 0;
  List<List<String>> nonMembershipTextList = [
    [
      'Save more with our Membership',
      'Enjoy the All-in-One\nHealthy Lifestyle',
      'Start from Rp299.000',
      'GET IT NOW',
    ],
    [
      '',
      'Enjoy your\nfavorite classes.',
      'Get healthier with fun classes. This unlimited class is included in the membership package and you can choose the class according to what you want.',
      'Join Membership',
    ],
    [
      'Free exercise, anytime and anywhere',
      'Workout From Home.',
      'Enjoy our many free video-on-demand workouts. Find videos that match your preferences and goals!',
      'Try Now',
    ],
  ];
  List<List<String>> membershipTextList = [
    [
      'Live healthier with GymThirty',
      'Enjoy your Favorite\nClasses',
      'Workout with streaming classes or live',
      'Try Now',
    ],
    [
      '',
      'Make your self stronger',
      'Get healthier with fun classes. This unlimited class is included in the membership package and you can choose the class according to what you want.',
      'Book Class',
    ],
    [
      'Free exercise, anytime and anywhere',
      'Workout From Home.',
      'Enjoy our many free video-on-demand workouts. Find videos that match your preferences and goals!',
      'Try Now',
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imgList.length,
          itemBuilder: (_, index, i) {
            return CarouselImageCard(
              img: widget.imgList[index],
              textList: widget.isMembership
                  ? membershipTextList[index]
                  : nonMembershipTextList[index],
              onPressed: () {
                widget.isMembership
                    ? context.router.push(
                        ClassRoute(
                          classType: offlineClass,
                          user: widget.user,
                        ),
                      )
                    : context.router.push(const MembershipRoute());
              },
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
