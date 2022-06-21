import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingWrapper extends StatefulWidget {
  const OnBoardingWrapper({Key? key}) : super(key: key);

  @override
  State<OnBoardingWrapper> createState() => _OnBoardingWrapperState();
}

class _OnBoardingWrapperState extends State<OnBoardingWrapper> {
  late SharedPreferences sharedPreferences;
  late bool hasGetStarted;

  void getStartedCheck() async {
    sharedPreferences = await SharedPreferences.getInstance();
    hasGetStarted = sharedPreferences.getBool("hasGetStarted") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
