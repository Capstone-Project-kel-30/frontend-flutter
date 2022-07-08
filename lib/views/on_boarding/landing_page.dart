import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/routes.gr.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/cutom_elevated_button.dart';
import '../widgets/vertical_space.dart';
import 'widgets/latar_img.dart';
import 'widgets/logo_img.dart';
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
                  subtit:
                      "Being healthy is more fun if you can\ndo it together with more friends. With the\nbest coaches and interesting classes.\nLet's make the Workout Zone your\nhealthy life partner!",
                  tit: "GET YOUR\nPERFECT CLASS\nWITH PERFECT\nTRAINERS\n\n",
                ),

                ///
                /////Button
                Column(
                  children: [
                    CustomOutlinedButton(
                      text: 'Login',
                      onPressed: () {
                        context.router.push(
                          const SignInRoute(),
                        );
                      },
                    ),
                    const VerticalSpace(height: 11),
                    CustomElevatedButton(
                      onPressed: () {
                        context.router.push(
                          const SignUpRoute(),
                        );
                      },
                      text: 'Register',
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
