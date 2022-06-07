import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/views/on_boarding/widgets/latar_img.dart';
import 'package:workout_zone/views/widgets/button_with_latar.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import 'widgets/logo_img.dart';
import 'widgets/button_tnp_latar.dart';
import 'widgets/text_started.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          const LatarImg(asset: 'assets/images/background2.png'),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 32, 20, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ///logo
                const LogoImg(),

                ///text
                const TextStarted(
                  subtit: 'asdasddasdasd',
                  tit: "Make Your Self \nStronger\n\n",
                ),

                ///
                /////Button
                Column(
                  children: [
                    ButtonTnpLatar(
                      title: 'Sign In',
                      press: () {
                        context.router.push(
                          const SignInRoute(),
                        );
                      },
                    ),
                    const VerticalSpace(height: 11),
                    ButtonWithLatar(
                      press: () {
                        context.router.push(
                          const SignUpRoute(),
                        );
                      },
                      title: 'Sign Up',
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
