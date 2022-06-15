import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes.gr.dart';
import '../widgets/cutom_elevated_button.dart';
import 'widgets/latar_img.dart';
import 'widgets/logo_img.dart';
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 33, 20, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const LogoImg(),
                const TextStarted(
                  subtit:
                      'Increase endurance and body strength\nto create a healthier life with Workout\nzone.',
                  tit: "Make Your Self \nStronger\n\n",
                ),
                CustomElevatedButton(
                  onPressed: () {
                    context.router.replaceAll([const Landingpage()]);
                  },
                  text: 'Get Started',
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
