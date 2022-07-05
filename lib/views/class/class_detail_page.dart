import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/class_model.dart';

import '../../models/user_model.dart';
import '../../utils/common/constant.dart';
import '../../utils/routes/routes.gr.dart';
import '../../utils/themes/app_theme.dart';
import '../membership/widgets/popup_join_membership.dart';
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
    required this.user,
    required this.classes,
  }) : super(key: key);

  final Class classes;
  final UserModel user;

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpace(height: 10),
                      Center(
                        child: DecoratedBox(
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
                      ),
                      const VerticalSpace(height: 25),
                      ClassTitle(
                        classType: classes.clastype!.toUpperCase(),
                        classTitle: classes.classname!,
                        location:
                            classes.clastype!.toUpperCase() == offlineClass
                                ? 'Gym Studio - Bandung'
                                : 'Streaming - Zoom',
                      ),
                      const VerticalSpace(height: 20),
                      ClassInfo(
                        date: classes.date!,
                        startTime: classes.clock!,
                        trainer: classes.trainer!,
                      ),
                      const VerticalSpace(height: 20),
                      ClassDescription(description: classes.description!),
                      const VerticalSpace(height: 20),
                      const FacilitiesInfo(
                        facilities: [
                          parkingArea,
                          gloves,
                          shower,
                          towel,
                          locker,
                          bottle,
                        ],
                      ),
                      const VerticalSpace(height: 20),
                      CustomElevatedButton(
                        text: 'Booking',
                        onPressed: () {
                          if (user.data!.memberType != "") {
                            context.router.replaceAll([
                              const BookingDetailRoute(),
                            ]);
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: EdgeInsets.zero,
                                  child: SizedBox(
                                    height: 180,
                                    child: PopUpJoinMembership(
                                      img: 'assets/images/dummy1.png',
                                      textList: [
                                        'Save more with our Membership',
                                        'Enjoy the All-in-One\nHealthy Lifestyle',
                                        'Start from Rp299.000',
                                        'GET IT NOW',
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
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
