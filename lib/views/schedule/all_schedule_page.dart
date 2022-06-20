import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/schedule/widget/Toggle_button.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';
import 'package:workout_zone/views/widgets/time_widget.dart';

class AllSchedulePage extends StatefulWidget {
  const AllSchedulePage({Key? key}) : super(key: key);

  @override
  State<AllSchedulePage> createState() => _AllSchedulePageState();
}

class _AllSchedulePageState extends State<AllSchedulePage> {
  @override
  Widget build(BuildContext context) {
    String activedButton = 'All';
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Schedule',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Row(
                  children: [
                    ButtonText(
                      isActive: activedButton == 'All',
                      onPressed: () {
                        setState(() {
                          activedButton = 'All';
                        });
                      },
                    ),
                    const HorizontalSpace(width: 10),
                    ToggleButton(
                      isActive: activedButton == 'Offline',
                      onPressed: () {
                        setState(() {});
                        (() {
                          context.router.push(const OfflineScheduleRoute());
                          activedButton = 'Offline';
                        });
                      },
                      text: 'Offline',
                      icon: 'assets/icons/Logo (2).svg',
                    ),
                    const HorizontalSpace(width: 10),
                    ToggleButton(
                      isActive: activedButton == 'Online',
                      onPressed: () {
                        setState(() {});
                        (() {
                          context.router.push(const OnlineScheduleRoute());
                          activedButton = 'Online';
                        });
                      },
                      text: 'Online',
                      icon: "assets/icons/Logo (1).svg",
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kLightColor),
                  padding: EdgeInsets.all(10),
                  width: 335,
                  height: 65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Geluud",
                            style: AppTheme.theme(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: kSemiBoldWeight,
                                    wordSpacing: 1.0),
                          ),
                          SvgPicture.asset("assets/icons/Location.png"),
                          Text(
                            "Live Streaming",
                            style: AppTheme.theme(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                  fontWeight: kRegularWeight,
                                ),
                          ),
                          Text(
                            "Live Streaming",
                            style: AppTheme.theme(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                  fontWeight: kRegularWeight,
                                ),
                          ),
                        ],
                      ),
                      const TimeWidget(
                        startTime: "22.00",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
