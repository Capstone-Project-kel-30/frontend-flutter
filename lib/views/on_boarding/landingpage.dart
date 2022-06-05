import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/views/on_boarding/widgets/latarimg.dart';

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
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
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
                    ButtonStarted(
                      press: () {
                        context.router.push(const SignUpRoute());
                      },
                      title: 'Sign Up',
                    ),
                    const SizedBox(
                      height: 13,
                    ),
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
