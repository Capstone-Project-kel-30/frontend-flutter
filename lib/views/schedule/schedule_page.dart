import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

import 'package:workout_zone/views/schedule/widget/Toggle_button.dart';
import 'package:workout_zone/views/schedule/widget/empty_jadwal.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  String activedButton = '';
  String jadwal = 'ja';
  String jadwalempty = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Schedule',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            Visibility(
              visible: jadwalempty == '',
              child: Row(
                children: [
                  ButtonText(
                    isActive: activedButton == 'All',
                    onPressed: () {
                      setState(() {
                        context.router.push(const AllScheduleRoute());
                        activedButton = 'All';
                      });
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 150,
              ),
              child: Visibility(
                visible: jadwal == '',
                child: const EmptyJadwal(),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
