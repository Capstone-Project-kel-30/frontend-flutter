import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/routes/routes.gr.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ScheduleRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabRouter) {
        return BottomNavigationBar(
          currentIndex: tabRouter.activeIndex,
          onTap: tabRouter.setActiveIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Home-Outline.svg'),
              activeIcon: SvgPicture.asset('assets/icons/Home-Fill.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Schedule-Outline.svg'),
              activeIcon: SvgPicture.asset('assets/icons/Schedule-Fill.svg'),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Profile-Outline.svg'),
              activeIcon: SvgPicture.asset('assets/icons/Profile-Fill.svg'),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
