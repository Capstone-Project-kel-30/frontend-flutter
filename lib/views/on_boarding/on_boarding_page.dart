import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/views/on_boarding/widgets/logo_img.dart';
import 'package:workout_zone/views/widgets/button_with_latar.dart';

import 'widgets/latar_img.dart';
import 'widgets/text_started.dart';

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
            padding: const EdgeInsets.fromLTRB(20, 33, 20, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const LogoImg(),
                const TextStarted(
                  subtit: 'akdokwakodakwodoad',
                  tit: "Make Your Self \nStronger\n\n",
                ),
                ButtonWithLatar(
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
