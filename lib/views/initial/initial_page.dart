import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/routes/routes.gr.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  void initialize() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool hasGetStarted = sharedPreferences.getBool("hasGetStarted") ?? false;
    bool hasLogin = sharedPreferences.getBool("hasLogin") ?? false;
    debugPrint('GET STARTED ::: ${hasGetStarted.toString()}');
    debugPrint('LOGIN ::: ${hasLogin.toString()}');
    if (hasLogin) {
      Future.delayed(Duration.zero, () {
        context.router.replaceAll([const HomeWrapper()]);
      });
    } else {
      if (hasGetStarted) {
        Future.delayed(Duration.zero, () {
          context.router.replaceAll([const SignInRoute()]);
        });
      } else {
        sharedPreferences.setBool("hasGetStarted", true);
        Future.delayed(Duration.zero, () {
          context.router.replaceAll([const OnBoardingRoute()]);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
