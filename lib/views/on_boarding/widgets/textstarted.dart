import 'package:flutter/material.dart';
import 'package:workout_zone/utils/themes/app_theme.dart';

class TextStarted extends StatelessWidget {
  const TextStarted({
    Key? key,
    required this.tit,
    required this.subtit,
  }) : super(key: key);
  final String tit, subtit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: kLightColor),
          children: [
            TextSpan(
              text: tit,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: subtit,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
