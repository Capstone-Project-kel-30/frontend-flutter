import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/routes/routes.gr.dart';
import '../../utils/themes/app_theme.dart';
import '../widgets/cutom_elevated_button.dart';
import '../widgets/image_carousel.dart';
import '../widgets/vertical_space.dart';
import 'widgets/class_description.dart';
import 'widgets/class_info.dart';
import 'widgets/class_title.dart';
import 'widgets/facilities_info.dart';

class ClassDetailPage extends StatelessWidget {
  ClassDetailPage({
    Key? key,
    required this.classType,
  }) : super(key: key);

  final String classType;

  final List<String> imgList = [
    'assets/images/dummy1.png',
    'assets/images/dummy2.jpg',
    'assets/images/dummy3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverLayoutBuilder(
            builder: (context, constraints) {
              bool isCollapsed = constraints.scrollOffset > 200;
              return SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                expandedHeight: 260,
                pinned: true,
                title: const Text('Details Class'),
                titleTextStyle: AppTheme.theme(context)
                    .appBarTheme
                    .titleTextStyle
                    ?.copyWith(
                      color: isCollapsed ? kDarkColor : kLightColor,
                    ),
                flexibleSpace: FlexibleSpaceBar(
                  background: ImageCarousel(imgList: imgList),
                ),
              );
            },
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const VerticalSpace(height: 10),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: HSLColor.fromColor(kGreyColor)
                              .withLightness(0.8)
                              .toColor(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const SizedBox(
                          height: 5,
                          width: 50,
                        ),
                      ),
                      const VerticalSpace(height: 25),
                      ClassTitle(
                        classType: classType,
                        classTitle: 'Boxing',
                        location: classType == 'Offline'
                            ? 'Gym Studio - Bandung'
                            : 'Streaming - Zoom',
                      ),
                      const VerticalSpace(height: 20),
                      const ClassInfo(
                        date: '03 June 2022',
                        startTime: '16:00',
                        trainer: 'trainer',
                      ),
                      const VerticalSpace(height: 20),
                      const ClassDescription(
                        description:
                            'Laboris qui laborum laboris voluptate est occaecat ad duis cillum deserunt consequat dolor. Dolor irure excepteur amet adipisicing in culpa magna sunt est aliquip aliqua. Quis esse id veniam non irure. Reprehenderit cupidatat eiusmod sit deserunt anim.',
                      ),
                      const VerticalSpace(height: 20),
                      const FacilitiesInfo(
                        facilities: [
                          'Parking area',
                          'Gloves',
                          'Shower',
                          'Towel',
                          'Locker',
                          'Bottle',
                        ],
                      ),
                      const VerticalSpace(height: 20),
                      CustomElevatedButton(
                        text: 'Booking',
                        onPressed: () {
                          context.router.replaceAll([
                            const BookingDetailRoute(),
                          ]);
                        },
                      ),
                      const VerticalSpace(height: 20),
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
