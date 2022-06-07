import 'package:flutter/material.dart';

import 'package:workout_zone/utils/themes/app_theme.dart';
import 'package:workout_zone/views/widgets/horizontal_space.dart';

class Bottomtxt extends StatelessWidget {
  const Bottomtxt({
    Key? key,
    required this.txt1,
    required this.txt2,
    required this.tekan,
  }) : super(key: key);
  final String txt1, txt2;
  final VoidCallback tekan;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          txt1,
          style: AppTheme.theme(context).textTheme.labelMedium?.copyWith(
                fontWeight: kRegularWeight,
              ),
        ),
        const HorizontalSpace(width: 5),
        ForgetPassBttn(
          titile: txt2,
          press: tekan,
        )
      ],
    );
  }
}

class ForgetPassBttn extends StatelessWidget {
  const ForgetPassBttn({
    Key? key,
    required this.titile,
    required this.press,
  }) : super(key: key);
  final String titile;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: press,
          child: Text(
            titile,
            style: AppTheme.theme(context).textTheme.labelMedium?.copyWith(
                  fontWeight: kRegularWeight,
                  color: kPrimaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
