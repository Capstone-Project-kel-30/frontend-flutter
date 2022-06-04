import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:workout_zone/utils/routes/routes.gr.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('On Boarding Under Development'),
            TextButton(
              child: const Text('Go to Sign In Page'),
              onPressed: () {
                context.router.push(const SignInRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
