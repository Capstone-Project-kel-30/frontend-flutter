import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/on_boarding/widgets/latarimg.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import 'widgets/buttonstarted.dart';
import 'widgets/textstarted.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          const LatarImg(asset: 'assets/images/background2.png'),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 32, 20, 53),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'assets/images/Logo.png',
                  scale: 2.2,
                ),
                const TextStarted(
                  subtit: 'asdasddasdasd',
                  tit: "Make Your Self \nStronger\n\n",
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: kPrimaryColor),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'SignUp',
                          style: TextStyle(color: kLightColor),
                        ),
                      ),
                    ),
                    const VerticalSpace(height: 11),
                    ButtonStarted(
                      press: () {
                        context.router.push(const SignInRoute());
                      },
                      title: 'Sign In',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
