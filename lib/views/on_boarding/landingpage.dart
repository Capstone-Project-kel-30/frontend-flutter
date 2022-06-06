import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';
import 'package:workout_zone/views/on_boarding/widgets/latarimg.dart';
import 'package:workout_zone/views/widgets/vertical_space.dart';

import 'widgets/logoimg.dart';
import 'widgets/signinbutton.dart';
import 'widgets/signupbutton.dart';
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
                    const SignUpButton(
                      title: 'SignUp',
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
