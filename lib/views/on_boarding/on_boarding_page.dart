import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import 'widgets/buttonstarted.dart';
import 'widgets/latarimg.dart';
import 'widgets/textstarted.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          const LatarImg(
            asset: 'assets/images/background1.png',
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 33, 20, 49),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'assets/images/Logo.png',
                  scale: 2.2,
                ),
                const TextStarted(
                  subtit: 'akdokwakodakwodoad',
                  tit: "Make Your Self \nStronger\n\n",
                ),
                ButtonStarted(
                  press: () {
                    context.router.push(const Landingpage());
                  },
                  title: 'Get Started',
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
