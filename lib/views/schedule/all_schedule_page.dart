import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/views/schedule/widget/Toggle_button.dart';
import 'package:workout_zone/views/schedule/widget/card_jadwal.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

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
                        activedButton = 'All';
                        setState(() {});
                      },
                    ),
                    const HorizontalSpace(width: 10),
                    ToggleButton(
                      isActive: activedButton == 'Offline',
                      onPressed: () {
                        setState(() {
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
                        setState(() {
                          context.router.push(const OnlineScheduleRoute());
                          activedButton = 'Online';
                        });
                      },
                      text: 'Online',
                      icon: "assets/icons/Logo (1).svg",
                    ),
                  ],
                ),
                //card
                //jadwal
                const VerticalSpace(height: 10),
                const CardJadwal(
                  logo: 'assets/icons/Location.png',
                  title1: 'Gelud',
                  title3: 'Trainer',
                  starttime: '22.00',
                  title2: 'Gym Studio - Bandung',
                ),
                const VerticalSpace(height: 10),
                const CardJadwal(
                  logo: 'assets/icons/Location.png',
                  title1: 'Gelud',
                  title3: 'Trainer',
                  starttime: '22.00',
                  title2: 'Gym Studio - Bandung',
                ),
              ],
            ),
          ),
        ));
  }
}
